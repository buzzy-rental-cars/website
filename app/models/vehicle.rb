class Vehicle < ActiveRecord::Base
  include Illustratable
  include Sluggable

  belongs_to :vehicle_type

  validates :name, presence: true, length: { in: 1..75 }, uniqueness: true
  validates :vehicle_type, presence: true
  validates :description, presence: true, length: { in: 1..250 }
  validates :seats, presence: true
  validates :economy_rating, presence: true
  validates :luggage_capacity, presence: true

  mount_uploader :photo, PhotoUploader
end
