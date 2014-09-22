class AddFieldsToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :vehicle_type_id, :integer, default: nil
    add_column :vehicles, :body, :text
    add_column :vehicles, :economy_rating, :decimal, precision: 2, scale: 1, default: 0.0
    add_column :vehicles, :seats, :integer, default: 0
    add_column :vehicles, :luggage_capacity, :string
  end
end
