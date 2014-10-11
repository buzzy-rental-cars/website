class RenameVehicleTypesToPriceCategories < ActiveRecord::Migration
  def change
    rename_table :vehicle_types, :price_categories
    rename_column :vehicle_categories, :vehicle_type_id, :price_category_id
  end
end
