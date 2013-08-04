class YogaStudiosController < ApplicationController
  def index
  	ActiveRecord::Base.include_root_in_json = false
	  render json: YogaStudio.near(params[:lat], params[:lng])
  end
end
