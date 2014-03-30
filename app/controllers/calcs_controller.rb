class CalcsController < ApplicationController



  def month
    @date=Date.new(2013,05,01)
    $join=0
    $join=Employee.joins("INNER JOIN positions ON positions.id = employees.position").select(:salary).where(end_date: nil).sum {|p| p[:salary]}
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
    sql = "SELECT datee, SUM(salary) from (SELECT DATE_FORMAT(start_date, '%Y-%m-01 00:00:00') as datee from employees join positions WHERE employees.position = positions.id GROUP BY DATE_FORMAT(start_date, '%Y-%m-01 00:00:00')) all_dates join employees join positions WHERE start_date <= datee AND (end_date is null OR end_date >= datee + interval 1 month) AND employees.position = positions.id GROUP BY datee"
    results = ActiveRecord::Base.connection.execute(sql)
    gon.chart_data = results
    render "chart"
  end


end 



# this goes into the data hash of Salary series of the chart... good luck with that :/
=begin

for i in Date.new(2012,02,01)..Date.today do
  @a=Calc.new(i)
  @a.current
end

=end

  
