class YogaStudio < ActiveRecord::Base
  attr_accessible :address, :facebook_id, :facebook_url, :latitude, :longitude, :name, :website
  validates_presence_of :address, :name
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  has_many :yoga_classes
end
