class Api::EventsController < ApplicationController

  # GET /events.json
  def index
    Time.zone = 'Paris'
    @events = Event.where("date >= ?", Time.zone.today).order(date: :asc)
    authorize! :read, Event
  end

  # GET /events/today.json
  def today
    Time.zone = 'Paris'
    @events = Event.where(date: Time.zone.today).order(start_time: :asc)
    render :index
    authorize! :read, Event
  end

  # GET /events/public.json
  def public
    Time.zone = 'Paris'
    @events = Event.where("date >= ? and public = ?", Time.zone.today, true).order(date: :asc)
    render :index
    authorize! :read, Event
  end

end
