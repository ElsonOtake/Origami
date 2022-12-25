class DealsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]
  before_action :authenticate_customer!
  load_and_authorize_resource

  # GET /deals or /deals.json
  def index
    customer = current_customer
    @category = customer.categories.find(params[:category_id])
    @deals = @category.deals.order(created_at: :desc)
  end

  # GET /deals/new
  def new
    customer = current_customer
    @category = customer.categories.find(params[:category_id])
    @deal = Deal.new
    @other_categories = customer.categories.where.not(id: @category)
  end

  # POST /deals or /deals.json
  def create
    customer = current_customer
    @category = customer.categories.find(params[:category_id])
    @deal = Deal.new(deal_params)
    @deal.author = current_customer
    @other_categories = customer.categories.where.not(id: @category)
    categories = Category.where(id: params[:category_ids])
    @deal.categories.push(categories)
    if @deal.save
      redirect_to category_deals_url(@category), notice: 'Transaction was successfully created.'
    else
      redirect_to category_deals_url(@category), notice: 'Unprocessable transaction.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deal_params
    params.require(:deal).permit(:name, :amount, category_ids: [])
  end
end
