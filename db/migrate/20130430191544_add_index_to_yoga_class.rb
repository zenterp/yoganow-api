class AddIndexToYogaClass < ActiveRecord::Migration
  def change
  	add_index :yoga_classes, :day
  	add_index :yoga_classes, :yoga_studio_id
  end
end
