class EmployeesController < ApplicationController

  def list
    render text: Employee.all.to_yaml #shows all employees in yaml format.
  end

  def insert 
	render text: "New Row added."
	@employee=Employee.new
	@employee[:name]=params[:name]
	@employee[:position]=params[:position]
	@employee[:months]=params[:months]
	@employee.save
  end
end

