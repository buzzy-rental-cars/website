class AddRentalCarManagerCategoryType < ActiveRecord::Migration
  def change
    add_column :vehicle_categories, :rental_car_manager_category_type, :integer
    add_column :home_page, :rental_car_manager_category_type, :integer
  end
end
