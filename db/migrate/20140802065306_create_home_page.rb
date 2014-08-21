class CreateHomePage < ActiveRecord::Migration
  def change
    create_table :home_page do |t|
      t.string :email
      t.string :phone
      t.string :facebook
      t.string :twitter
      t.string :picture
      t.text :content

      t.timestamps
    end
  end
end
