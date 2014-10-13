class VehicleCategory < ActiveRecord::Base
  include RentalCarManager

  belongs_to :price_category
  has_one :home_page

  validates :name, presence: true, length: { in: 1..75 }
  validates :price_category, presence: true
  validates :description, presence: true, length: { in: 1..250 }
  validates :display_order, presence: true, numericality: { only_integer: true }

  has_attached_file :photo, styles: { thumbnail: "200x200#" }
  
  validates_attachment :photo, presence: true,
    content_type: { content_type: "image/jpeg" },
    size: { in: 0..5.megabytes }
end
