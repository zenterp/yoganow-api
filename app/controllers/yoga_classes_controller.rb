class YogaClassesController < ApplicationController
  def index   
	render json: YogaClass.where(yoga_studio_id: params[:yoga_studio_id])
  end
end
