module RentalCarManager
  extend ActiveSupport::Concern

  included do
    validates :rental_car_manager_category_type, presence: true

    enum rental_car_manager_category_type: {
      buzzy_cars: 1,
      people_mover: 2,
      mini_bus: 3,
      buzzy_on_a_budget: 4,
      buzzy_mobile_car: 5,
    }
  end
end
