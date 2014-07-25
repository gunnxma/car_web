class DepartmentsController < ApplicationController
  before_filter :check_power
  def index
    @departments = Department.where("id > 1")
  end
  
  def new
    @department = Department.new
  end
  
  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to :action => :index
    else
      render "new"
    end
  end
  
  def edit
    @department = Department.find(params[:id])
  end
  
  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(department_params)
      redirect_to :action => :index
    else
      render "edit"
    end
  end
  
  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to action: :index
  end
  
  private
  
  def department_params
    params.require(:department).permit(:name)
  end
end
