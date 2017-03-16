class Api::ResidentsController < Api::BaseController

  # GET /residents.json
  def index
    @residents = User.all
    authorize! :read, User
  end

  def last
    Time.zone = 'Paris'
    @residents = User.all.order('created_at DESC').limit(6)
    render :index
    authorize! :read, User
  end

end
