class RenameVehiclesToVehicleCategories < ActiveRecord::Migration
  def change
    rename_table :vehicles, :vehicle_categories
  end
end
