class AttendingsController < ApplicationController
  
  def new
    @attending = Attending.new
  end

  def going
    event = Event.find(params[:event_id])
    @attending = Attending.find_by(event: event, user: current_user)
    if @attending.nil?
      @attending = Attending.new(user: current_user, event: event, going: 'yes')
      respond_to do |format|
        if @attending.save
          format.js
        else
          format.html { render action: 'new' }
        end
      end
    elsif @attending.going != 'yes'
      respond_to do |format|
        @attending.update(going: 'yes')
        format.js
      end
    end   
  end

  def not_going
    event = Event.find(params[:event_id])
    @attending = Attending.find_by(event: event, user: current_user)
    if @attending.nil?
      @attending = Attending.new(user: current_user, event: event, going: 'no')
      respond_to do |format|
        if @attending.save
          format.js
        else
          format.html { render action: 'new' }
        end
      end
    elsif @attending.going != 'no'
      respond_to do |format|
        @attending.update(going: 'no')
        format.js
      end
    end   
  end

  def maybe
    event = Event.find(params[:event_id])
    @attending = Attending.find_by(event: event, user: current_user)
    if @attending.nil?
      @attending = Attending.new(user: current_user, event: event, going: 'maybe')
      respond_to do |format|
        if @attending.save
          format.js
        else
          format.html { render action: 'new' }
        end
      end
    elsif @attending.going != 'maybe'
      respond_to do |format|
        @attending.update(going: 'maybe')
        format.js
      end
    end   
  end

end