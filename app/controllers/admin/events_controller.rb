class Admin::EventsController < Admin::AdminController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  # GET /events
  # GET /events.json
  def index
    @searchable_columns = [
                            [t('events.attributes.title'), 'title'], 
                            [t('events.attributes.body'), 'body']
                          ]

    @events = Event.page(params[:page]).per_page(events_per_page)

    @events = @events.send('search_by_' + params[:column], params[:query]) if params[:query].present? && @searchable_columns.map(&:second).include?(params[:column])
    @events = @events.where('start_time >= ?', params[:start_date]) if params[:start_date].present?
    @events = @events.where('end_time <= ? OR end_time IS NULL', params[:end_date]) if params[:end_date].present?
    @events = @events.search_by_created_by(params[:created_by]) if params[:created_by].present?
    @events = @events.search_by_updated_by(params[:updated_by]) if params[:updated_by].present?
    @events = @events.reorder(sort_column + ' ' + sort_direction)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  def publish
    @event.update_attributes(publish: !@event.publish)
    index

    respond_to do |format|
      format.js
    end
  end

  # GET /events/new
  def new
	    # The new method is used by the Calendar js event creator
    unless params[:ajax].blank?
      # Presetting some values for the event
      body = nil
      final = nil
      
      # Building start time
      start = params[:start_time]
      start_time = DateTime.new(start[2].to_i,start[1].to_i, start[0].to_i, start[3].to_i, start[4].to_i)
      
      unless params[:toggle_time].blank?
        # End time only exists if not all day
        final = params[:end_time]
        final_time = DateTime.new(final[2].to_i,final[1].to_i, final[0].to_i, final[3].to_i, final[4].to_i)
      end

      unless params[:body].blank?
        body = params[:body]
      end

      @event = Event.new(title: params[:title], body: body, start_time: start_time, end_time: final_time, created_by: current_user, updated_by: current_user)

      respond_to do |format|
        if @event.save
          format.js {render action: 'event'}
        else
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    if params[:toggle_time].blank?
      start = DateTime.strptime("#{event_params['start_time(1i)']}-#{event_params['start_time(2i)']}-#{event_params['start_time(3i)']}T#{event_params['start_time(4i)']}:#{event_params['start_time(5i)']}", '%Y-%m-%dT%H:%M')
      @event = Event.new(title: event_params[:title], body: event_params[:body], start_time: start, end_time: nil, created_by: current_user, updated_by: current_user)
    else
      @event = Event.new(event_params)
      @event.created_by = @event.updated_by = current_user
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to [:admin, @event], notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    final = nil
    start = DateTime.strptime("#{event_params['start_time(1i)']}-#{event_params['start_time(2i)']}-#{event_params['start_time(3i)']}T#{event_params['start_time(4i)']}:#{event_params['start_time(5i)']}", '%Y-%m-%dT%H:%M')
    unless params[:toggle_time].blank?
      final = DateTime.strptime("#{event_params['end_time(1i)']}-#{event_params['end_time(2i)']}-#{event_params['end_time(3i)']}T#{event_params['end_time(4i)']}:#{event_params['end_time(5i)']}", '%Y-%m-%dT%H:%M')
    end
    respond_to do |format|
      if @event.update(title: event_params[:title], body: event_params[:body], start_time: start, end_time: final, updated_by: current_user)
        # TO DO if for notification
        unless params[:notification].blank?
          Attending.where(event: @event).where(notification: true).each do |a|
            SystemMailer.event_update(@event, a.user).deliver
          end
        end
        format.html { redirect_to [:admin, @event], notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_multiple
    unless params[:unpublish].nil?
      Event.where(id: params[:event_ids]).update_all(publish: false)
    end
    unless params[:publish].nil?
      Event.where(id: params[:event_ids]).update_all(publish: true)
    end
    unless params[:destroy].nil?
      Event.destroy_all(id: params[:event_ids])
    end
    respond_to do |format|
        format.js { index; render action: 'index' }
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    Attending.where(event: @event).destroy_all
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url }
      format.js   { index; render action: 'index' }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    if Event.column_names.include?(params[:sort])
      cookies[:events_order] = params[:sort]
    else
      Setting.events_order
    end
  end
  
  def sort_direction
    if %w(asc desc).include?(params[:direction]) 
      cookies[:events_direction] = params[:direction]
    else
      Setting.events_direction
    end
  end

  def events_per_page
    per_page = params[:per_page].to_i
    if (1..200000001).include? per_page
      cookies[:events_pagination] = per_page
    else
      Setting.events_pagination
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :body, :start_time, :end_time, :notification)
  end
end
