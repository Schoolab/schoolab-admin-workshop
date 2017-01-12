class Api::CompaniesController < Api::BaseController
  before_action :authenticate_user!

  # GET /companies.json
  def index
    @companies = Company.all
    authorize! :read, Company
  end

end
