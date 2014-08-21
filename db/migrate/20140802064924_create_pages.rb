class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :slug
      t.string :description
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
