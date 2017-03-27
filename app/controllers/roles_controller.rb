class RolesController < ApplicationController
  before_action :set_role, only: [:destroy]

  def destroy
    authorize! :manage, @role.user
    @role.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: I18n.t('roles.destroy') }
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

end
