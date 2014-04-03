class PositionsController < ApplicationController
  require 'open-uri'

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


    RestClient.post "http://0.0.0.0:3000/create_json", { desc: 'QA assistant', salary: 6 }.to_json


  def add_db
    uri = URI.parse("http://0.0.0.0:3000/add_db")
    resp = Net::HTTP.get_response(uri)
    data = JSON.parse(resp.body)
    puts data    
  end


end


