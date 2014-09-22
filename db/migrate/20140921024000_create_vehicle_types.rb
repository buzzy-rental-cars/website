class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :name
      t.string :slug
      t.boolean :published

      t.timestamps
    end
  end
end
