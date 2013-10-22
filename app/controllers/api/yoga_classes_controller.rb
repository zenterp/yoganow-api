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

  def nearby
    @studios = YogaStudio.near([params[:lat], params[:lng]])
    @yoga_classes = YogaClass.today.where(yoga_studio_id: @studios.collect(&:id))

    studios = JSON.parse(@studios.to_json)
    @studios.each_with_index  do |studio, i|
      studio_id = studio.id
      yoga_classes = @yoga_classes.select {|yoga_class| yoga_class.yoga_studio_id == studio_id }
      studios[i]['yoga_classes'] = yoga_classes
    end

    render json: studios
  end

  def create
    if params[:yoga_class][:day].class == Array
      yoga_classes = []
      yoga_class_params = params[:yoga_class]
      days = yoga_class_params.delete(:day)
      days.each do |day|
        yoga_class_params.delete(:day)
        yoga_class = YogaClass.create(yoga_class_params.merge(day: day))
        yoga_classes.push(yoga_class)
      end
      render json: yoga_classes
    else
      @yoga_class = YogaClass.create(params[:yoga_class]))
      render json: @yoga_class
    end
  end 
end
