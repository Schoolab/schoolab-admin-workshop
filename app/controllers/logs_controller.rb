class LogsController < ApplicationController

  def create
    @log = Log.new(log_params)

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log.project, notice: 'L\'élément a été ajouté.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    authorize! :update, @log
    @log = Log.find(params[:id])
    @log.destroy
    respond_to do |format|
      format.html { redirect_to @log.project, notice: 'L\'élément a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private

    def log_params
      params.require(:log).permit(:title, :date, :description, :project_id)
    end

end
