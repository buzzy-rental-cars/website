class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :slug
      t.string :description
      t.string :photo
      t.boolean :published

      t.timestamps
    end
  end
end
