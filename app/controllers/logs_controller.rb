class LogsController < ApplicationController
  load_and_authorize_resource

  def index
    @project = Project.find(params[:project_id])
    render 'projects/logs'
  end

  def create
    @log = Log.new(log_params)
    @log.project = Project.find(params[:project_id])
    respond_to do |format|
      if @log.save
        format.html { redirect_to project_logs_path(@log.project), notice: 'L\'élément a été ajouté.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    respond_to do |format|
      format.html { redirect_to project_logs_path(@log.project), notice: 'L\'élément a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private

    def log_params
      params.require(:log).permit(:title, :date, :description)
    end

end
