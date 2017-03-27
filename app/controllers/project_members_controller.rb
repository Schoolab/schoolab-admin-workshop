class ProjectMembersController < ApplicationController
  before_action :set_project

  def create
    @role = Role.new role_params
    @role.entity = @project
    @role.save
    respond_to do |format|
      format.html { redirect_to :back, notice: I18n.t('project_members.create') }
    end
    authorize! :update, @project
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def role_params
      params.require(:role).permit(:user_id, :name)
    end

end
