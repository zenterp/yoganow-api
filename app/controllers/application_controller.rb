class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :allow_all_origins

  def allow_all_origins
  	headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end 

  def location  	
  	location = params[:location] || "30.406363,-97.733763"
  	render json: Location.find(location).to_json
  end 
end
