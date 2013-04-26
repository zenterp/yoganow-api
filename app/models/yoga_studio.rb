class YogaStudio < ActiveRecord::Base
  attr_accessible :address, :facebook_id, :facebook_url, :latitude, :longitude, :name, :website
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
