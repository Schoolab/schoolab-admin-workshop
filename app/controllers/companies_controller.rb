class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy, :recover]

  load_and_authorize_resource

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/deleted
  def deleted
    @companies = Company.only_deleted
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'Company was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH /companies/1/recover
  def recover
    @company.recover
    respond_to do |format|
      format.html { redirect_to companies_path, notice: 'L\'évènement à bien été reccupéré.' }
      format.json { head :success }
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :floor_id, :image, :description, :phone, :email)
    end
end
