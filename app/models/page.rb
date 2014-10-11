class Page < ActiveRecord::Base
  include Illustratable
  include Sluggable

  validates :name, presence: true, length: { in: 1..75 }, uniqueness: true
  validates :description, presence: true, length: { in: 1..250 }, uniqueness: true
  validates :display_order, presence: true, numericality: { only_integer: true }

  before_validation :prevent_reserved_name

  private

  def prevent_reserved_name
    if self.slug.in?(['log-in', 'log-out', 'pages', 'users', 'vehicle-categories', 'price-categories', 'home', 'our-vehicles'])
      self.errors.add(name, 'is a reserved word. Choose a different name.')
    end
  end
end
