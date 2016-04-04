class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @company = Company.find(params[:company_id])
    @employee = Employee.find(params[:id])
  end

  # GET /employees/new
  def new
    @company = Company.find(params[:company_id])
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
    @company = Company.find(params[:company_id])
    @employee = Employee.find(params[:id])
    session[:return_to] ||= request.referer
  end

  # POST /employees
  # POST /employees.json
  def create
    @company = Company.find(params[:company_id])
    @employee = @company.employees.new(employee_params)
    @employee.user = current_user
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @company, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    @company = Company.find(params[:company_id])
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :job)
    end
end
