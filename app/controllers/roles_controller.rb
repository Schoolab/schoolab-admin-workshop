class RolesController < ApplicationController
  before_action :set_role, only: [:destroy]

  def destroy
    authorize! :manage, @role.user
    @role.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Role was removed.' }
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

end
