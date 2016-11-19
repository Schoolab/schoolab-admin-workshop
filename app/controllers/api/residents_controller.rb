class Api::ResidentsController < ApplicationController

  # GET /residents.json
  def index
    @residents = User.all
    authorize! :read, User
  end

end
