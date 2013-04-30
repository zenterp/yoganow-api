class YogaClassesController < ApplicationController
  def index
    studio = YogaStudio.find(params[:yoga_studio_id])

	render json: studio.yoga_classes
  end
end
