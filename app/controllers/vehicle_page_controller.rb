class VehiclePageController < ApplicationController
  def show
    @vehicle_types = policy_scope(VehicleType.where(published: true).order(:name))
  end
end
