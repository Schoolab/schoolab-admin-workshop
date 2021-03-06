class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update, :destroy, :recover]
  load_and_authorize_resource

  # GET /reservations
  # GET /reservations.json
  def index
    Time.zone = 'Paris'
    @reservations = Reservation.where("start_time >= ?", Time.zone.today).order(start_time: :asc)
  end

  # GET /reservations/past
  def past
    Time.zone = 'Paris'
    @reservations = Reservation.where("start_time < ?", Time.zone.today).order(start_time: :desc)
  end

  # GET /reservations/deleted
  def deleted
    Time.zone = 'Paris'
    @reservations = Reservation.only_deleted.order(start_time: :desc)
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to :back, notice: I18n.t('reservations.create') }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservations_path, notice: I18n.t('reservations.update') }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /reservations/1/recover
  def recover
    @reservation.recover
    respond_to do |format|
      format.html { redirect_to reservations_path, notice: I18n.t('reservations.recover') }
      format.json { head :success }
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: I18n.t('reservations.destroy') }
      format.json { head :no_content }
    end
  end

  # GET /reservations/search
  def search
    if params.has_key?(:room_search)
      @search = RoomSearch.new do |s|
        d = Date.parse(params[:room_search][:start_time_date])
        s.start_time = Time.zone.local(d.year, d.month, d.day, params[:room_search]["start_time_time(4i)"].to_i, params[:room_search]["start_time_time(5i)"].to_i, 0)
        s.length = params[:room_search]["length_time(4i)"].to_i * 3600 + params[:room_search]["length_time(5i)"].to_i * 60
        s.length_time = Time.zone.local(d.year, d.month, d.day, params[:room_search]["length_time(4i)"].to_i, params[:room_search]["length_time(5i)"].to_i, 0)
      end

      @available_rooms = MeetingRoom.where(reservable: true).order(:floor_id).select { |m| !m.reservation_at(@search.start_time, @search.start_time + @search.length.to_s.to_i)}
      @unavailable_rooms = MeetingRoom.where(reservable: true).all.order(:floor_id).select { |m| m.reservation_at(@search.start_time, @search.start_time + @search.length.to_s.to_i)}
      @reservation = Reservation.new
    else
      @search = RoomSearch.new
    end
    authorize! :manage, Reservation
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.with_deleted.find(params[:id])
    end

    # Search parameters
    def search_params
      params.require(:room_search).permit(:length_time)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:start_time, :end_time, :meeting_room_id, :user_id, :note)
    end
  end
