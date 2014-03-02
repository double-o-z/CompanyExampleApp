class PositionsController < ApplicationController

  def list
    render text: Position.all.to_yaml #shows all positions in yaml format.
  end

  def insert
	render text: "New Row added." 
	@position=Position.new
	@position[:desc]=params[:desc]
	@position[:salary]=params[:salary]
	@position.save
  end
end

