class CalcsController < ApplicationController

  def list
	render text: Employee.joins("INNER JOIN positions ON positions.id = employees.position").select(:months, :salary).sum {|p| p.months * p.salary }.to_i
  end
end 
