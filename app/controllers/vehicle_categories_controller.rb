class VehicleCategoriesController < ApplicationController
  before_action :load_vehicle_category, except: [:index, :new, :create]

  def index
    @vehicle_categories = policy_scope(VehicleCategory.order(:created_at))
    @price_categories = policy_scope(PriceCategory.order(:name))
  end

  def new
    @vehicle_category = VehicleCategory.new
    authorize @vehicle_category
  end

  def create
    @vehicle_category = VehicleCategory.new(vehicle_category_params)
    authorize @vehicle_category
    if @vehicle_category.save
      redirect_to @vehicle_category, notice: "Successfully created vehicle category."
    else
      render :new
    end
  end

  def update
    if @vehicle_category.update_attributes(vehicle_category_params)
      redirect_to @vehicle_category, notice: "Successfully updated vehicle category."
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
      :photo_cache,
      :body,
      :seats,
      :economy_rating,
      :luggage_capacity,
      :published,
      illustrations_attributes: [
        :id,
        :illustration,
        :illustration_cache,
        :_destroy
      ]
    )
  end

  def load_vehicle_category
    @vehicle_category = VehicleCategory.find_by slug: params[:id]
    authorize @vehicle_category
  end
end
