class VehicleCategoriesController < ApplicationController
  before_action :load_vehicle_category, except: [:index, :new, :create]

  def index
    @vehicle_categories = policy_scope(VehicleCategory.order(:display_order))
    @price_categories = policy_scope(PriceCategory.order(:display_order))
  end

  def new
    @vehicle_category = VehicleCategory.new
    authorize @vehicle_category
  end

  def create
    @vehicle_category = VehicleCategory.new(vehicle_category_params)
    authorize @vehicle_category
    if @vehicle_category.save
      redirect_to vehicle_categories_path, notice: "Successfully created vehicle category."
    else
      render :new
    end
  end

  def update
    if @vehicle_category.update_attributes(vehicle_category_params)
      redirect_to vehicle_categories_path, notice: "Successfully updated vehicle category."
    else
      render :edit
    end
  end

  def destroy
    @vehicle_category.destroy
    redirect_to vehicle_categories_path, notice: "Successfully destroyed vehicle category."
  end

  private

  def vehicle_category_params
    params.require(:vehicle_category).permit(
      :name,
      :description,
      :price_category_id,
      :photo,
      :body,
      :economy_rating,
      :rental_car_manager_category_type,
      :display_order,
      :published
    )
  end

  def load_vehicle_category
    @vehicle_category = VehicleCategory.find params[:id]
    authorize @vehicle_category
  end
end
