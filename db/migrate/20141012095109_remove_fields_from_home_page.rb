class RemoveFieldsFromHomePage < ActiveRecord::Migration
  def change
    remove_column :home_page, :email, :string
    remove_column :home_page, :phone, :string
    remove_column :home_page, :facebook, :string
    remove_column :home_page, :twitter, :string
  end
end
