class CalcsController < ApplicationController

  def month
    @join=0
    @join=Employee.joins("INNER JOIN positions ON positions.id = employees.position").select(:salary).where(end_date: nil).sum {|p| p[:salary]}
  render "month"
  end

  def total
    @sum1,@sum2,@sum3=0.0,0.0,0.0
    @sum1=Employee.joins("INNER JOIN positions ON positions.id = employees.position").select(:salary, :start_date).where(end_date: nil).sum {|p| p[:salary] * (Date.today - p[:start_date].to_date).to_i/30}
    @sum2=Employee.joins("INNER JOIN positions ON positions.id = employees.position").select(:salary, :start_date, :end_date).where(end_date: true).sum {|s| s[:salary] * (s[:end_date].to_date - s[:start_date].to_date).to_i/30}
    @sum3=@sum1+@sum2
    @sum3
    render "total"
  end

  def chart
    render "chart"
  end

  def month_chart
    # this method will have a loop to check in each month (from min-date to max-date ?) how the amount of salary (calculated via month method?? ) 
    @sum4=0
    @sum4=Employee.joins("INNER JOIN positions ON positions.id = employees.position").select(:salary, :start_date, :end_date).where(end_date: nil).sum {|p| p[:salary] }
  end

end 
