class HomePage < ActiveRecord::Base
  include RentalCarManager

  self.table_name = 'home_page'

  belongs_to :promoted_page, class_name: Page

  validates :promotional_message, presence: true
  validates :promoted_page_id, presence: true
end
