class PositionsController < ApplicationController

  def list
    render "list"
  end

  def new_position  
    render "new_position"
  end

  def insert
    @position=Position.new
    @position[:desc]=params[:desc]
    @position[:salary]=params[:salary]
    @position.save
    flash[:notice] = "Position was added successfully!"
    redirect_to action: "new_position"
  end


  def insert_site_db
    @p=params[:positions] if params[:positions]
    @e=params[:employees] if params[:employees]
    @count_positions,@count_employees=0,0
    if @p then
      @p.each do |p|
        unless Position.all.exists?(desc: "#{p[:desc]}") then
          @position=Position.new
          @position[:desc]=p[:desc]
          @position[:salary]=p[:salary]
          @position.save
          @count_positions+=1
        end
      end
    end
    if @e then
      @e.each do |e|
        unless Employee.all.exists?(name: "#{e[:name]}") then
          @employee=Employee.new
          @employee[:name]=e[:name]
          position_id=Position.find_by_desc("#{e[:position]}")
          @employee[:position]=position_id[:id]
          @employee[:start_date]=e[:start_date]
          @employee[:end_date]=e[:end_date]
          @employee.save
          @count_employees+=1
        end
      end
    end
    puts "Success. Added #{@count_positions} Positions, and #{@count_employees} Employees to Database."
    render text: "Success. Added #{@count_positions} Positions, and #{@count_employees} Employees to Database."
  end
 
  def user_insert_db
    render "user_insert_db"
  end
  


end


