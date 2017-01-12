module Api
  class BaseController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken

    respond_to :json
  end
end