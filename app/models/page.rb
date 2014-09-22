class Page < ActiveRecord::Base
  include Illustratable
  include Sluggable

  validates :name, presence: true, length: { in: 1..75 }, uniqueness: true
  validates :description, presence: true, length: { in: 1..250 }, uniqueness: true

  before_validation :prevent_reserved_name

  private

  def prevent_reserved_name
    if self.slug.in?(['log-in', 'log-out', 'pages', 'users', 'vehicles', 'vehicle-types', 'home', 'our-vehicles'])
      self.errors.add(name, 'is a reserved word. Choose a different name.')
    end
  end
end
