class ResidentsController < ApplicationController

  # GET /residents
  def index
    @users = User.all
    authorize! :read, User
  end

  # GET /floors/new
  def new
    @user = User.new
    authorize! :manage, User
  end

  # POST /floors
  def create
    @user = User.new(user_params)
    @user.role = 'user'
    @user.password = "123456"
    @user.password_confirmation = "123456"
    if @user.save
      redirect_to residents_path, notice: 'Resident was successfully added.'
    else
      render :new
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

  # Un-RESTful methods

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

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :title, :company_id)
    end

end
