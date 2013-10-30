class AddMindbodyStudioidToYogaStudio < ActiveRecord::Migration
  def change
    add_column :yoga_studios, :mindbody_studioid, :integer
  end
end
