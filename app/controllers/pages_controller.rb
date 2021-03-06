class PagesController < ApplicationController
  before_action :load_page, except: [:index, :new, :create]

  def index
    @pages = policy_scope(Page.order(:display_order))
  end

  def new
    @page = Page.new
    authorize @page
  end

  def create
    @page = Page.new(page_params)
    authorize @page
    if @page.save
      redirect_to @page, notice: "Successfully created page."
    else
      render :new
    end
  end

  def update
    if @page.update_attributes(page_params)
      redirect_to @page, notice: "Successfully updated page."
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_path, notice: "Successfully destroyed page."
  end

  private

  def page_params
    params.require(:page).permit(
      :name,
      :description,
      :body,
      :display_order,
      :published,
      illustrations_attributes: [
        :id,
        :illustration,
        :_destroy
      ]
    )
  end

  def load_page
    @page = Page.find_by slug: params[:id]
    authorize @page
  end
end
