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


  def add_db
      # puts params
      @position=Position.new
      @position[:desc]=params[:desc]
      @position[:salary]=params[:salary]
      @position.save
    puts "Success"
    render text: "Success"
  end


end


