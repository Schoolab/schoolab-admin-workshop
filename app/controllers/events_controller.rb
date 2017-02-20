class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :modify_date_params, :only => [:create, :update]

  load_and_authorize_resource only: [:new, :edit, :create, :update, :destroy]

  # GET /events
  def index
    Time.zone = 'Paris'
    @past_events = Event.where("date < ?", Time.zone.today).order(date: :desc)
    @events = Event.where("date >= ?", Time.zone.today).order(date: :asc)
    authorize! :read, Event
  end

  # GET /events/past
  def past
    Time.zone = 'Paris'
    @past_events = Event.where("date < ?", Time.zone.today).order(date: :desc)
    authorize! :read, Event
  end

  # GET /events/1
  def show
    authorize! :read, Event
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_url, notice: 'Évènement créé avec succès.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_url, notice: 'Évènement mis à jour.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'L\'évènement a bien été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def modify_date_params
      params[:event][:date] = Date.parse(params[:event][:date])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :date, :start_time, :end_time, :location, :host, :price, :link, :description, :public, :weekly, :image)
    end
  end
