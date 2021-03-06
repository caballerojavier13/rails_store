class OrdersController < ApplicationController
  skip_before_action :logged_in, only: [:new, :create]

  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy, :shipped]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.page(params[:page]).per(8)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
   def new
    if @cart.cart_items.empty?
      redirect_to store_url, notice: "Your cart is currently empty"
      return
    end

    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.get_cart_items(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        Notifier.received(@order).deliver
        format.html { redirect_to store_url, notice: 'Your order has been successfully submitted,
          thank you for your business.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def shipped
    Notifier.shipped(@order).deliver
    redirect_to :back
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
       # Notifier.shipped(@order).deliver
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :country, :province_state, :city, :postal_code, :address1, :address2, :email, :pay_type)
    end
end
