class Admin::EventsController < Admin::AdminController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.order(:start_time)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    unless params[:ajax].nil?
      # Presetting some values for the event
      body = nil
      final = nil
      all_day = true
      
      # Building start time
      start = params[:start_time]
      start_time = DateTime.new(start[2].to_i,start[1].to_i, start[0].to_i, start[3].to_i, start[4].to_i)
      
      unless params[:toggle_time].nil?
        # End time only exists if not all day
        final = params[:end_time]
        final_time = DateTime.new(final[2].to_i,final[1].to_i, final[0].to_i, final[3].to_i, final[4].to_i)
      end

      unless params[:body].nil?
        body = params[:body]
      end

      @event = Event.new(title: params[:title], body: body, start_time: start_time, end_time: final_time)

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
    if params[:toggle_time].empty?
      start = DateTime.strptime("#{event_params['start_time(1i)']}-#{event_params['start_time(2i)']}-#{event_params['start_time(3i)']}T#{event_params['start_time(4i)']}:#{event_params['start_time(5i)']}", '%Y-%m-%dT%H:%M')
      @event = Event.new(title: event_params[:title], body: event_params[:body], start_time: start, end_time: nil)
    else
      @event = Event.new(event_params)
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
    respond_to do |format|
      if params[:toggle_time].empty?
        start = DateTime.strptime("#{event_params['start_time(1i)']}-#{event_params['start_time(2i)']}-#{event_params['start_time(3i)']}T#{event_params['start_time(4i)']}:#{event_params['start_time(5i)']}", '%Y-%m-%dT%H:%M')
        if @event.update(title: event_params[:title], body: event_params[:body], start_time: start, end_time: nil)
          Attending.where(event: @event).each do |a|
            SystemMailer.event_update(@event, a.user).deliver
          end
          format.html { redirect_to [:admin, @event], notice: 'Event was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      else
        if @event.update(event_params)
          Attending.where(event: @event).each do |a|
            SystemMailer.event_update(@event, a.user).deliver
          end
          format.html { redirect_to [:admin, @event], notice: 'Event was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    Attending.where(event: @event).destroy_all
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :body, :start_time, :end_time)
  end
end
