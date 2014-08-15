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
    @going = [Attending.yes.count, Attending.no.count, Attending.maybe.count]
  end



end
