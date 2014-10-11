class PriceCategory < ActiveRecord::Base
  include Sluggable

  has_many :vehicle_categories, dependent: :destroy

  validates :name, presence: true, length: { in: 1..75 }, uniqueness: true
  validates :display_order, presence: true, numericality: { only_integer: true }
end
