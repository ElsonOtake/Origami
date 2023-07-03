class CategoriesController < ApplicationController
  before_action :authenticate_customer!
  load_and_authorize_resource

  # GET /categories or /categories.json
  def index
    @categories = current_customer.categories.all.order(created_at: :desc)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.customer = current_customer

    if @category.save
      redirect_to categories_url, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
