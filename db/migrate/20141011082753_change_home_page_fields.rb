class ChangeHomePageFields < ActiveRecord::Migration
  def change
    rename_column :home_page, :content, :promotional_message
    add_column :home_page, :promoted_page_id, :integer, default: nil
  end
end
