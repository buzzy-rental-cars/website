module VehicleCategoriesHelper
  def economy_ratings
    [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0]
  end

  def vehicle_category_display_order_values(vehicle_category)
    if vehicle_category.id
      (1..VehicleCategory.all.count).to_a
    else
      (1..(VehicleCategory.all.count + 1)).to_a
    end
  end
end
