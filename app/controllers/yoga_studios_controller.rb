class YogaStudiosController < ApplicationController
  def index
  	ActiveRecord::Base.include_root_in_json = true

    location = params["location"] || "berkeley"
    
	render json: YogaStudio.near(location)
  end
end
