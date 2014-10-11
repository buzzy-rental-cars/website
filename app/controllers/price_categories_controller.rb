class PriceCategoriesController < ApplicationController
  before_action :load_price_category, except: [:index, :new, :create]

  def index
    @price_categories = policy_scope(PriceCategory.order(:display_order))
  end

  def new
    @price_category = PriceCategory.new
    authorize @price_category
  end

  def create
    @price_category = PriceCategory.new(price_category_params)
    authorize @price_category
    if @price_category.save
      redirect_to price_categories_path, notice: "Successfully created price category."
    else
      render :new
    end
  end

  def update
    if @price_category.update_attributes(price_category_params)
      redirect_to price_categories_path, notice: "Successfully updated price category."
    else
      render :edit
    end
  end

  def destroy
    @price_category.destroy
    redirect_to price_categories_path, notice: "Successfully destroyed price category."
  end

  private

  def price_category_params
    params.require(:price_category).permit(
      :name,
      :published
    )
  end

  def load_price_category
    @price_category = PriceCategory.find_by slug: params[:id]
    authorize @price_category
  end
end
