class Api::YogaStudiosController < ApplicationController
  def nearby
  	ActiveRecord::Base.include_root_in_json = false
	  render json: { 
      lat: params[:lat], 
      lng: params[:lng], 
      studios: YogaStudio.near([params[:lat], params[:lng]]) 
    }.to_json
  end
  
  def create
    if (@studio = YogaStudio.create(params[:yoga_studio]))
      render json: @studio
    else
      render status: :forbidden
    end
  end 
end
