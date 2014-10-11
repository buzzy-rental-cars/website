class VehiclePageController < ApplicationController
  def show
    @price_categories = policy_scope(PriceCategory.where(published: true).order(:name))
  end
end
