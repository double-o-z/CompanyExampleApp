class CalcsController < ApplicationController
require 'time_difference'
  def month
    @join=0
    @join=Employee.joins("INNER JOIN positions ON positions.id = employees.position").select(:salary).where(end_date: nil).sum {|p| p[:salary]}
  end

  def total
    @sum1,@sum2,@sum3=0.0,0.0,0.0
    @sum1=Employee.joins("INNER JOIN positions ON positions.id = employees.position").select(:salary, :start_date).where(end_date: nil).sum {|p| p[:salary] * TimeDifference.between(p[:start_date], Time.now).in_months}
    @sum2=Employee.joins("INNER JOIN positions ON positions.id = employees.position").select(:salary, :start_date, :end_date).where(end_date: true).sum {|s| s[:salary] * TimeDifference.between(s[:start_date], s[:end_date]).in_months}
    @sum3=@sum1+@sum2
    
  end
end 
