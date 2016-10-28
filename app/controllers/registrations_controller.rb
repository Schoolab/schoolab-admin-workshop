class RegistrationsController < Devise::RegistrationsController
  private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :email_suffix, :email_prefix)
    end

    def account_update_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :title, :phone, :office_address, :lync, :wat_link, :entity)
    end
end
