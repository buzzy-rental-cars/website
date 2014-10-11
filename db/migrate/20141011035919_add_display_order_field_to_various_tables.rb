class AddDisplayOrderFieldToVariousTables < ActiveRecord::Migration
  def change
    add_column :pages, :display_order, :integer, default: 1
    add_column :price_categories, :display_order, :integer, default: 1
    add_column :vehicle_categories, :display_order, :integer, default: 1
  end
end
