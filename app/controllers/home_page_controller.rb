class HomePageController < ApplicationController
  before_action :load_home_page

  def update
    if @home_page.update_attributes(home_page_params)
      redirect_to @home_page, notice: "Successfully updated home page."
    else
      render :edit
    end
  end

  private

  def home_page_params
    params.require(:home_page).permit(
      :email,
      :phone,
      :facebook,
      :twitter,
      :picture,
      :picture_cache,
      :content
    )
  end

  def load_home_page
    @home_page = HomePage.first
    authorize @home_page
  end
end
