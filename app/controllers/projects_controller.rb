class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :recover]

  load_and_authorize_resource except: [:index]

  # GET /projects
  # GET /projects.json
  def index
    authorize! :read, Project
    if current_user.role == "admin"
      @projects = Project.all
    else
      @projects = current_user.projects
    end
  end

  # GET /projects/deleted
  def deleted
    @projects = Project.only_deleted
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @other_users = User.all - @project.users
    @logs = Log.where("project_id = ?", params[:id]).order('date DESC')
  end

  # GET /projects/new
  def new
    @project = Project.new
    @types_collection = Project.types_collection
    @seasons_collection = Season.collection_for_select
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH /projects/1/recover
  def recover
    @project.recover
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Le projet à bien été recupéré.' }
      format.json { head :success }
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    p "test"
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.with_deleted.find(params[:id])
      @types_collection = Project.types_collection
      @seasons_collection = Season.collection_for_select
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :project_type, :season_id, :description, :image)
    end
  end
