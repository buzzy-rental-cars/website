class VehiclesController < ApplicationController
  before_action :load_vehicle, except: [:index, :new, :create]

  def index
    @vehicles = policy_scope(Vehicle.order(:created_at).page(params[:page]).per(100))
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
      :name
    )
  end

  def load_vehicle
    @vehicle = Vehicle.find_by_slug slug: params[:id]
    authorize @vehicle
  end
end
