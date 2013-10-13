class Api::YogaClassesController < ApplicationController
  def index   
    studio_id = params[:yoga_studio_id]
    @classes = YogaClass.at_studio(studio_id).group_by_day
	  render json: {
      studio: YogaStudio.find(studio_id),
      classes: @classes,
      today: Time.now.strftime('%A').downcase
    }.to_json
  end

  def create
    if (@yoga_class = YogaClass.create(params[:yoga_studio]))
      render json: @yoga_class
    else
      render status: :forbidden
    end
  end 
end
