class RemoveBodyFromVehicleCategories < ActiveRecord::Migration
  def change
    remove_column :vehicle_categories, :body, :text
  end
end
