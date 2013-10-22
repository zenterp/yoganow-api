class ChangeYogaClassTypeToInteger < ActiveRecord::Migration
  def up
    remove_column :yoga_classes, :start_time
    add_column :yoga_classes, :start_time, :integer
  end

  def down
    remove_column :yoga_classes, :start_time
    add_column :yoga_classes, :start_time, :time
  end
end
