class DealsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /deals or /deals.json
  def index
    user = current_user
    @category = user.categories.find(params[:category_id])
    @deals = @category.deals.order(created_at: :desc)
  end

  # GET /deals/1 or /deals/1.json
  def show; end

  # GET /deals/new
  def new
    user = current_user
    @category = user.categories.find(params[:category_id])
    @deal = Deal.new
    @other_categories = user.categories.where.not(id: @category).includes(:icon)
  end

  # GET /deals/1/edit
  def edit; end

  # POST /deals or /deals.json
  def create
    user = current_user
    @category = user.categories.find(params[:category_id])
    @deal = Deal.new(deal_params)
    @deal.author = current_user
    @other_categories = user.categories.where.not(id: @category)
    categories = Category.where(id: params[:category_ids])
    @deal.categories.push(categories)
    respond_to do |format|
      if @deal.save
        format.html { redirect_to category_deals_url(@category), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { redirect_to category_deals_url(@category), notice: 'Unprocessable transaction.' }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1 or /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to deal_url(@deal), notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1 or /deals/1.json
  def destroy
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deal_params
    params.require(:deal).permit(:author_id, :name, :amount, :category_id, category_ids: [])
  end
end
