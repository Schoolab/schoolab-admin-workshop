class FloorsController < ApplicationController
  before_action :set_floor, only: [:show, :edit, :update, :destroy, :recover]

  load_and_authorize_resource except: [:index]

  # GET /floors
  # GET /floors.json
  def index
    @floors = Floor.all.order('number ASC')
    authorize! :manage, Floor
  end

  def deleted
    @floors = Floor.only_deleted.order('number ASC')
    authorize! :manage, Floor
  end

  # GET /floors/1
  # GET /floors/1.json
  def show
    @companies = Company.where('floor_id = ?', @floor.id)
    @spaces = MeetingRoom.where('floor_id = ?', @floor.id)
  end

  # GET /floors/new
  def new
    @floor = Floor.new
  end

  # GET /floors/1/edit
  def edit
  end

  # POST /floors
  # POST /floors.json
  def create
    @floor = Floor.new(floor_params)

    respond_to do |format|
      if @floor.save
        format.html { redirect_to floors_path, notice: I18n.t('floors.create') }
        format.json { render :show, status: :created, location: @floor }
      else
        format.html { render :new }
        format.json { render json: @floor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /floors/1
  # PATCH/PUT /floors/1.json
  def update
    respond_to do |format|
      if @floor.update(floor_params)
        format.html { redirect_to floors_path, notice: I18n.t('floors.update') }
        format.json { render :show, status: :ok, location: @floor }
      else
        format.html { render :edit }
        format.json { render json: @floor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /meeting_rooms/1/recover
  def recover
    @floor.recover
    respond_to do |format|
      format.html { redirect_to floors_path, notice: I18n.t('floors.recover') }
      format.json { head :success }
    end
    authorize! :manage, Floor
  end

  # DELETE /floors/1
  # DELETE /floors/1.json
  def destroy
    @floor.destroy
    respond_to do |format|
      format.html { redirect_to floors_url, notice: I18n.t('floors.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floor
      @floor = Floor.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def floor_params
      params.require(:floor).permit(:number, :name, :description, :colour)
    end
end
