class DealsController < ApplicationController
  before_action :set_category
  before_action :authenticate_customer!
  load_and_authorize_resource

  # GET /deals or /deals.json
  def index
    @deals = @category.deals.distinct.order(created_at: :desc)
  end

  # GET /deals/new
  def new
    @deal = Deal.new
    @other_categories = current_customer.categories.where.not(id: params[:category_id])
  end

  # POST /deals or /deals.json
  def create
    @deal = Deal.new(deal_params)
    @deal.author = current_customer
    categories = Category.where(id: params[:deal][:category_ids])
    @deal.categories.push(categories)
    @deal.amount /= categories.size if categories.size > 1
    if @deal.save
      redirect_to category_deals_url(@category), notice: 'Transaction was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = current_customer.categories.find(params[:category_id])
  end

  # Only allow a list of trusted parameters through.
  def deal_params
    params.require(:deal).permit(:name, :amount, category_ids: [])
  end
end
