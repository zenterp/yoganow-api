class YogaClass < ActiveRecord::Base
  attr_accessible \
    :instructor_name,
    :data,
    :day,
    :duration, 
    :name,
    :price,
    :start_time,
    :yoga_studio_id

  validates_presence_of \
    :yoga_studio_id,
    :name,
    :start_time,
    :duration,
    :day

  belongs_to :yoga_studio

  scope :today, where(day: Time.now.strftime('%A').downcase)
  scope :on_day, ->(day) { where(day: day) }
  scope :at_studio, ->(id) { where(yoga_studio_id: id) }

  def self.group_by_day
    h = {}
    self.all.each do |yoga_class|
      h[yoga_class.day] ||= []
      h[yoga_class.day].push(yoga_class)
    end
    return h
  end

end
