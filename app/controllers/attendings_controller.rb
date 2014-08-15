class AttendingsController < ApplicationController
  before_action :set_attending, only: [:show, :edit, :update, :destroy]
  
  def new
    @attending = Attending.new
  end

  def going
    event = Event.find(params[:event_id])
    @attending = Attending.new(user: current_user, event: event, going: 'yes')

    respond_to do |format|
      if @attending.save
        format.js
        format.json { render action: 'show', status: :created, location: @attending }
      else
        format.html { render action: 'new' }
        format.json { render json: @attending.errors, status: :unprocessable_entity }
      end
    end
  end

  def not_going
    event = Event.find(params[:event_id])
    @attending = Attending.create(user: current_user, event: event, going: 'no')

    respond_to do |format|
      if @attending.save
        format.js
        format.json { render action: 'show', status: :created, location: @attending }
      else
        format.html { render action: 'new' }
        format.json { render json: @attending.errors, status: :unprocessable_entity }
      end
    end
  end

  def maybe
    event = Event.find(params[:event_id])
    @attending = Attending.create(user: current_user, event: event, going: 'maybe')

    respond_to do |format|
      if @attending.save
        format.js
        format.json { render action: 'show', status: :created, location: @attending }
      else
        format.html { render action: 'new' }
        format.json { render json: @attending.errors, status: :unprocessable_entity }
      end
    end
  end

end
