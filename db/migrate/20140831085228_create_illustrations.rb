class CreateIllustrations < ActiveRecord::Migration
  def change
    create_table :illustrations do |t|
      t.references :illustratable, polymorphic: true
      t.string :illustration

      t.timestamps
    end
  end
end
