class YogaStudiosController < ApplicationController
  def index
    location = params["location"] || "berkeley"
    
	render json: YogaStudio.near(location)
  end
end
