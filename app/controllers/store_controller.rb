class StoreController < ApplicationController
	skip_before_action :logged_in
  include CurrentCart
  before_action :set_cart

  def index
  	 if params[:search]
      @products = Product.search(params[:search]).order(:title)

      if @products.blank?
        flash.now[:result]="Sorry, we couldn't find any results for that search."
      end
  else
    @products = Product.all.order(:title)
  end
  end

end
