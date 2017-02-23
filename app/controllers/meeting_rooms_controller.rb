class MeetingRoomsController < ApplicationController
  before_action :set_meeting_room, only: [:show, :edit, :update, :destroy, :recover]
  load_and_authorize_resource

  # GET /meeting_rooms
  # GET /meeting_rooms.json
  def index
    @meeting_rooms = MeetingRoom.all
  end

  # GET /meeting_rooms/deleted
  def deleted
    @meeting_rooms = MeetingRoom.only_deleted
    render :index
  end

  # GET /meeting_rooms/1
  # GET /meeting_rooms/1.json
  def show
  end

  # GET /meeting_rooms/new
  def new
    @meeting_room = MeetingRoom.new
  end

  # GET /meeting_rooms/1/edit
  def edit
  end

  # POST /meeting_rooms
  # POST /meeting_rooms.json
  def create
    @meeting_room = MeetingRoom.new(meeting_room_params)

    respond_to do |format|
      if @meeting_room.save
        format.html { redirect_to meeting_rooms_url, notice: 'Meeting room was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_room }
      else
        format.html { render :new }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meeting_rooms/1
  # PATCH/PUT /meeting_rooms/1.json
  def update
    respond_to do |format|
      if @meeting_room.update(meeting_room_params)
        format.html { redirect_to meeting_rooms_url, notice: 'Meeting room was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_room }
      else
        format.html { render :edit }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /meeting_rooms/1/recover
  def recover
    @meeting_room.recover
    respond_to do |format|
      format.html { redirect_to meeting_rooms_url, notice: 'Meeting room was successfully recovered.' }
      format.json { head :success }
    end
  end

  # DELETE /meeting_rooms/1
  # DELETE /meeting_rooms/1.json
  def destroy
    @meeting_room.destroy
    respond_to do |format|
      format.html { redirect_to meeting_rooms_url, notice: 'Meeting room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_room
      @meeting_room = MeetingRoom.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_room_params
      params.require(:meeting_room).permit(:name, :colour, :floor_id, :photo, :capacity, :reservable, :description, :status)
    end
end
