class SplashController < ApplicationController
  def index
    redirect_to categories_path if customer_signed_in?
  end
end
