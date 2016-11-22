class Api::CompaniesController < ApplicationController

  # GET /companies.json
  def index
    @companies = Company.all
    authorize! :read, Company
  end

end
