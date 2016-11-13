class ResidentsController < ApplicationController

  # GET /residents
  def index
    @users = User.all
    authorize! :read, User
  end

  # PATCH /residents/make_admin/:id
  def make_admin
    @user = User.find(params[:id])
    @user.role = "admin"
    if @user.save
      redirect_to residents_path
    else
      redirect_to residents_path, notice: 'Unable to make admin'
    end
    authorize! :manage, User
  end

  # PATCH /residents/make_user/:id
  def make_user
    @user = User.find(params[:id])
    @user.role = "user"
    if @user.save
      redirect_to residents_path
    else
      redirect_to residents_path, notice: 'Unable to remove admin'
    end
    authorize! :manage, User
  end

  # DELETE /residents/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to residents_url, notice: 'Residents was successfully removed.'
    authorize! :manage, User
  end

end
