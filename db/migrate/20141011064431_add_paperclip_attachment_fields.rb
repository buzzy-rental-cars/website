class AddPaperclipAttachmentFields < ActiveRecord::Migration
  def up
    add_attachment :illustrations, :illustration
    add_attachment :vehicle_categories, :photo
  end

  def self.down
    remove_attachment :vehicle_categories, :photo
    remove_attachment :illustrations, :illustration
  end
end
