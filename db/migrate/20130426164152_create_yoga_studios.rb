class CreateYogaStudios < ActiveRecord::Migration
  def change
    create_table :yoga_studios do |t|
      t.string :name
      t.string :address
      t.string :website
      t.string :facebook_url
      t.string :facebook_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
