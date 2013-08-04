class YogaStudiosController < ApplicationController
  def index
  	ActiveRecord::Base.include_root_in_json = false
	  render json: { lat: params[:lat], lng: params[:lng], studios: YogaStudio.near(params[:lat], params[:lng]) }.to_json
  end
end
