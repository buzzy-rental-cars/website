class HomePage < ActiveRecord::Base
  self.table_name = 'home_page'

  mount_uploader :picture, PictureUploader
end
