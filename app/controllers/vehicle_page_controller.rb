class VehiclePageController < ApplicationController
  def show
    @price_categories = policy_scope(PriceCategory.where(published: true).order(:display_order))
  end
end
