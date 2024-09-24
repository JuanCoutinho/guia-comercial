class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :is_admin?, except: [:index, :show]

  def index
    @companies = if params[:search].present?
                   Company.where('LOWER(name) LIKE ?', "%#{params[:search].downcase}%")
                 else
                   Company.all
                 end
  end

  def show; end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy!

    respond_to do |format|
      format.html { redirect_to companies_path, status: :see_other, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_company
    @company = Company.find_by(id: params[:id])

    unless @company
      redirect_to companies_path, alert: "Company not found." and return
    end
  end

  def company_params
    params.require(:company).permit(:name, :address, :phone, :website, :category, :image)
  end
end
