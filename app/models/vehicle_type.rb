class VehicleType < ActiveRecord::Base
  include Sluggable

  has_many :vehicles, dependent: :destroy

  validates :name, presence: true, length: { in: 1..75 }, uniqueness: true
end
