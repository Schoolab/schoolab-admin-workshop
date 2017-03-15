class Api::ResidentsController < Api::BaseController

  # GET /residents.json
  def index
    @residents = User.all
    authorize! :read, User
  end

  def last
    Time.zone = 'Paris'
    @residents = User.where('created_at >= ?', Time.zone.today - 7).order('created_at DESC')
    render :index
    authorize! :read, User
  end

end
