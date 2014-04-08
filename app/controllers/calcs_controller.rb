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
    sql = "SELECT datee, SUM(salary) from (SELECT DATE_FORMAT(start_date, '%Y-%m-01 03:00:00') as datee from employees join positions WHERE employees.position = positions.id GROUP BY DATE_FORMAT(start_date, '%Y-%m-01 03:00:00')) all_dates join employees join positions WHERE start_date <= datee AND (end_date is null OR end_date >= datee + interval 1 month) AND employees.position = positions.id GROUP BY datee"
    results = ActiveRecord::Base.connection.execute(sql)
    results.map {|row| row[0]=Time.parse(row[0]).utc.to_i*1000 }
    gon.chart_data = results
    gon.point_start = results.first.first
    render "chart"
  end
  def fields
    sql = "select SUM(position between 128 and 131) as managers, SUM(position between 132 and 133) as developers, SUM(position between 134 and 136) as administration, SUM(position between 137 and 138) as finance, SUM(position between 139 and 141) as qa from employees join positions where employees.position = positions.id and end_date is null;"
    results = ActiveRecord::Base.connection.execute(sql)
    gon.data = results.first
    render "fields"
  end

end 



# this goes into the data hash of Salary series of the chart... good luck with that :/
=begin

for i in Date.new(2012,02,01)..Date.today do
  @a=Calc.new(i)
  @a.current
end

=end

  
