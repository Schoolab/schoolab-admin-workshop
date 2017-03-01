class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :recover]
  before_filter :modify_date_params, :only => [:create, :update]

  load_and_authorize_resource only: [:new, :edit, :create, :update, :destroy]

  # GET /events
  def index
    Time.zone = 'Paris'
    today = Time.zone.today

    @today = Event.where("date = ?", today).order(date: :asc)
    @tomorrow = Event.where("date = ?", today + 1).order(date: :asc)
    @week_events = Event.where("date > ? and date < ?", today + 1, today + 7).order(date: :asc)
    authorize! :read, Event
  end

  # GET /events/past
  def past
    Time.zone = 'Paris'
    today = Time.zone.today

    @events = Event.where("date < ?", today).order(date: :desc)
    authorize! :manage, Event
  end

  # GET /events/future
  def future
    Time.zone = 'Paris'
    today = Time.zone.today

    @events = Event.where("date > ?", today + 7).order(date: :asc)
    authorize! :manage, Event
  end

  # GET /events/past
  def deleted
    Time.zone = 'Paris'
    today = Time.zone.today

    @events = Event.only_deleted.order(date: :desc)
    authorize! :manage, Event
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

  # PATCH /events/1/recover
  def recover
    @event.recover
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'L\'évènement à bien été reccupéré.' }
      format.json { head :success }
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
      @event = Event.with_deleted.find(params[:id])
    end

    def modify_date_params
      params[:event][:date] = Date.parse(params[:event][:date])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :date, :start_time, :end_time, :location, :host, :price, :link, :description, :public, :weekly, :image)
    end
  end
