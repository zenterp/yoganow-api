class YogaClassesController < ApplicationController
  def index
    studio = YogaStudio.find(params[:yoga_studio])

	render json: studio.yoga_classes
  end
end
