class YogaClass < ActiveRecord::Base
  attr_accessible :data, :day, :duration, :name, :price, :start_time, :yoga_studio_id
  validates_presence_of :yoga_studio_id, :name, :start_time, :duration, :day
  belongs_to :yoga_studio
end
