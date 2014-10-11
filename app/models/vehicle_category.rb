class VehicleCategory < ActiveRecord::Base
  include Sluggable

  belongs_to :price_category

  validates :name, presence: true, length: { in: 1..75 }, uniqueness: true
  validates :price_category, presence: true
  validates :description, presence: true, length: { in: 1..250 }
  validates :display_order, presence: true, numericality: { only_integer: true }

  has_attached_file :photo, styles: { thumbnail: "160x100#" }
  
  validates_attachment :photo, presence: true,
    content_type: { content_type: "image/jpeg" },
    size: { in: 0..5.megabytes }
  
  before_post_process :photo_filename
  
  # Set photo filename in the database:
  def photo_filename
    if self.photo.present?
      self.photo_file_name = self.photo_file_name.split('.')[0].to_url + ".jpg"
    end
  end
  
  # Set photo filename in the file system:
  Paperclip.interpolates :photo_filename do |attachment, style|
    attachment.instance.photo_filename
  end
end
