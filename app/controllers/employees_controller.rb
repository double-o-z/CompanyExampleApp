class EmployeesController < ApplicationController

  def fire
    @employee=Employee.find(params[:id])
    @employee[:end_date]=Date.today
    @employee.save
    redirect_to action: "list"
  end

  def list
    render "list"
  end

  def new_employee  
    render "new_employee"
  end

  def insert
    @employee=Employee.new
    @employee[:name]=params[:name]
    @employee[:position]=params[:position]
    @employee[:start_date]=Date.today

    @employee.save
    redirect_to action: "new_employee"
  end


end

