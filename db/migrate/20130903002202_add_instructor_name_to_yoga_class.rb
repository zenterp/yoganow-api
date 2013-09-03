class AddInstructorNameToYogaClass < ActiveRecord::Migration
  def change
    add_column :yoga_classes, :instructor_name, :string
  end
end
