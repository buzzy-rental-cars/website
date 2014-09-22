class VehicleTypesController < ApplicationController
  before_action :load_vehicle_type, except: [:index, :new, :create]

  def index
    @vehicle_types = policy_scope(VehicleType.order(:created_at))
  end

  def new
    @vehicle_type = VehicleType.new
    authorize @vehicle_type
  end

  def create
    @vehicle_type = VehicleType.new(vehicle_type_params)
    authorize @vehicle_type
    if @vehicle_type.save
      redirect_to vehicle_types_path, notice: "Successfully created vehicle type."
    else
      render :new
    end
  end

  def update
    if @vehicle_type.update_attributes(vehicle_type_params)
      redirect_to vehicle_types_path, notice: "Successfully updated vehicle type."
    else
      render :edit
    end
  end

  def destroy
    @vehicle_type.destroy
    redirect_to vehicle_types_path, notice: "Successfully destroyed vehicle type."
  end

  private

  def vehicle_type_params
    params.require(:vehicle_type).permit(
      :name,
      :published
    )
  end

  def load_vehicle_type
    @vehicle_type = VehicleType.find_by slug: params[:id]
    authorize @vehicle_type
  end
end
