class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy, :recover]
  before_action :set_program

  load_and_authorize_resource except: [:index]

  # GET /programs/:program_id/seasons
  # GET /programs/:program_id/seasons.json
  def index
    authorize! :manage, Season
    @seasons = Season.all.order(name: :asc)
  end

  # GET /programs/:program_id/seasons/deleted
  def deleted
    @seasons = Season.only_deleted
  end

  # GET /programs/:program_id/seasons/1
  # GET /programs/:program_id/seasons/1.json
  def show
  end

  # GET /programs/:program_id/seasons/new
  def new
    @season = Season.new
    @season.program = @program
  end

  # GET /programs/:program_id/seasons/1/edit
  def edit
  end

  # POST /programs/:program_id/seasons
  # POST /programs/:program_id/seasons.json
  def create
    @season = Season.new(season_params)
    @season.program = @program

    respond_to do |format|
      if @season.save
        format.html { redirect_to program_seasons_path, notice: 'season was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /programs/:program_id/seasons/1
  # PATCH/PUT /programs/:program_id/seasons/1.json
  def update
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to program_seasons_path, notice: 'season was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH /programs/:program_id/seasons/1/recover
  def recover
    @season.recover
    respond_to do |format|
      format.html { redirect_to program_seasons_path, notice: 'Le seasonme à bien été reccupéré.' }
      format.json { head :success }
    end
  end

  # DELETE /seasons/1
  # DELETE /seasons/1.json
  def destroy
    @season.destroy
    respond_to do |format|
      format.html { redirect_to program_seasons_path, notice: 'season was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.with_deleted.find(params[:id])
    end

    def set_program
      @program = Program.with_deleted.find(params[:program_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def season_params
      params.require(:season).permit(:name, :description, :program_id, :image)
    end
  end
