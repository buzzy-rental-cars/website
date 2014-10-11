class RemoveFieldsFromVehicleCategories < ActiveRecord::Migration
  def change
    remove_column :vehicle_categories, :seats, :integer, default: 0
    remove_column :vehicle_categories, :luggage_capacity, :string
  end
end
