class Api::ResidentsController < Api::BaseController

  # GET /residents.json
  def index
    @residents = User.all
    authorize! :read, User
  end

end
