module PriceCategoriesHelper
  def price_category_display_order_values(price_category)
    if price_category.id
      (1..PriceCategory.all.count).to_a
    else
      (1..(PriceCategory.all.count + 1)).to_a
    end
  end
end
