class RemoveCarrierwaveAttachmentFields < ActiveRecord::Migration
  def change
    remove_column :home_page, :picture, :string
    remove_column :illustrations, :illustration, :string
    remove_column :vehicle_categories, :photo, :string
  end
end
