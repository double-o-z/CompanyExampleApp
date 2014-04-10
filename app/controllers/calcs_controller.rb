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
    sql = "select SUM(positions.desc LIKE 'C%O' OR positions.desc LIKE '%Manager') as managers, 
       SUM(positions.desc LIKE '%Developer%') as developers, 
	   SUM(positions.desc LIKE '%Secretary' OR positions.desc LIKE 'Maintenance man') as administration, 
	   SUM(positions.desc LIKE '%Finance%') as finance, 
	   SUM(positions.desc LIKE '%QA%') as qa 
from positions join employees
where employees.position = positions.id and end_date is null;"
    results = ActiveRecord::Base.connection.execute(sql)
    gon.data = results.first
    render "fields"
  end

end 


  
