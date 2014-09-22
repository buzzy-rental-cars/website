class VehiclesController < ApplicationController
  before_action :load_vehicle, except: [:index, :new, :create]

  def index
    @vehicles = policy_scope(Vehicle.order(:created_at))
    @vehicle_types = policy_scope(VehicleType.order(:name))
  end

  def new
    @vehicle = Vehicle.new
    authorize @vehicle
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    authorize @vehicle
    if @vehicle.save
      redirect_to @vehicle, notice: "Successfully created vehicle."
    else
      render :new
    end
  end

  def update
    if @vehicle.update_attributes(vehicle_params)
      redirect_to @vehicle, notice: "Successfully updated vehicle."
    else
      render :edit
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_path, notice: "Successfully destroyed vehicle."
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :name,
      :description,
      :vehicle_type_id,
      :photo,
      :photo_cache,
      :body,
      :seats,
      :economy_rating,
      :luggage_capacity,
      :published
    )
  end

  def load_vehicle
    @vehicle = Vehicle.find_by slug: params[:id]
    authorize @vehicle
  end
end
