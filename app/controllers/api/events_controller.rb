class Api::EventsController < ApplicationController

  # GET /events.json
  def index
    Time.zone = 'Paris'
    @events = Event.where("datetime >= ?", Time.zone.today).order(datetime: :asc)
    authorize! :read, Event
  end

  # GET /events/today.json
  def today
    Time.zone = 'Paris'
    @events = Event.where(datetime: Time.zone.today).order(datetime: :asc)
    authorize! :read, Event
  end

end