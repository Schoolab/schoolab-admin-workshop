class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: ->{request.format.json?}

  check_authorization :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render body: nil, :status => :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end
end
