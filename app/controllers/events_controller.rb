class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @attending = Attending.find_by(event: @event, user: current_user)
    @going = Attending.yes.where(event: @event)
    @not_going = Attending.no.where(event: @event)
    @indecisive = Attending.maybe.where(event: @event)

    respond_to do |format|
      format.js {render 'calendar/detail', event: @event}
      format.html { render action: 'show'}
    end
  end

  def going
    @event = Event.find(params[:event_id])
    @attending = Attending.find_by(event: @event, user: current_user)
    @going = Attending.yes.where(event: @event)
    @not_going = Attending.no.where(event: @event)
    @indecisive = Attending.maybe.where(event: @event)
    if @attending.blank?
      @attending = Attending.new(user: current_user, event: @event, going: 'yes')
      respond_to do |format|
        if @attending.save
          format.js
        else
          format.html { render action: 'new' }
        end
      end
    elsif @attending.going != 'yes'
      respond_to do |format|
        @attending.update(going: 'yes', notification: true)
        format.js
      end
    end
  end

  def notify
    @event = Event.find(params[:event_id])
    @attending = Attending.find_by(event: @event, user: current_user)
    @attending.update(notification: !@attending.notification)
    @going = Attending.yes.where(event: @event)
    @not_going = Attending.no.where(event: @event)
    @indecisive = Attending.maybe.where(event: @event)

    respond_to do |format|
      format.js
    end
  end

  def not_going
    @event = Event.find(params[:event_id])
    @attending = Attending.find_by(event: @event, user: current_user)
    @going = Attending.yes.where(event: @event)
    @not_going = Attending.no.where(event: @event)
    @indecisive = Attending.maybe.where(event: @event)
    if @attending.blank?
      @attending = Attending.new(user: current_user, event: @event, going: 'no', notification: false)
      respond_to do |format|
        if @attending.save
          format.js
        else
          format.html { render action: 'new' }
        end
      end
    elsif @attending.going != 'no'
      respond_to do |format|
        @attending.update(going: 'no', notification: false)
        format.js
      end
    end
  end

  def maybe
    @event = Event.find(params[:event_id])
    @attending = Attending.find_by(event: @event, user: current_user)
    @going = Attending.yes.where(event: @event)
    @not_going = Attending.no.where(event: @event)
    @indecisive = Attending.maybe.where(event: @event)
    if @attending.blank?
      @attending = Attending.new(user: current_user, event: @event, going: 'maybe')
      respond_to do |format|
        if @attending.save
          format.js
        else
          format.html { render action: 'new' }
        end
      end
    elsif @attending.going != 'maybe'
      respond_to do |format|
        @attending.update(going: 'maybe', notification: true)
        format.js
      end
    end
  end
end
