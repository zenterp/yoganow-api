class CreateYogaClasses < ActiveRecord::Migration
  def change
    create_table :yoga_classes do |t|
      t.time :start_time
      t.integer :duration
      t.integer :yoga_studio_id
      t.string :name
      t.string :data
      t.string :day
      t.integer :price

      t.timestamps
    end
  end
end
