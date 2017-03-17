class ResidentsController < ApplicationController

  # GET /residents
  def index
    @users = User.all.order(:first_name)
    authorize! :read, User
    respond_to do |format|
      format.html
      format.xls {
        filename = "Residents-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
        send_data(@users.to_xls(:name => filename, columns: [:first_name, :last_name, :email, :phone, :title, { :company => [:name] }], headers: ["Prénom", "Nom", "Email", "Téléphone", "Poste", "Entreprise"]))
      }
    end
  end

  # GET /residents/:id
  def show
    @user = User.find(params[:id])
    @reservations = @user.reservations.order('reservations.start_time DESC')
    authorize! :read, @user
  end

  # GET /residents/new
  def new
    @user = User.new
    authorize! :create, User
  end

  # POST /residents
  def create
    @user = User.new(user_params)
    @user.role = 'user'
    @user.password = "123456"
    @user.password_confirmation = "123456"
    if @user.save
      p ApplicationMailer.welcome_email @user
      redirect_to residents_path, notice: 'Resident was successfully added.'
    else
      render :new
    end
    authorize! :create, User
  end

  # DELETE /residents/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to residents_url, notice: 'Residents was successfully removed.'
    authorize! :destroy, @user
  end

  # GET /residents/:id
  def edit
    @user = User.find(params[:id])
    authorize! :update, @user
  end

  # PATCH/PUT /residents/:id
  # PATCH/PUT /residents/:id.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to residents_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    authorize! :update, @user
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :title, :company_id, :role, :photo)
    end

end
