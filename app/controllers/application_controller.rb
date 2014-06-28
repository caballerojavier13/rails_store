class ApplicationController < ActionController::Base
  before_action :logged_in
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_cart
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
  end
  helper_method :current_cart

  protected

  def logged_in
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in to continue"
    end
  end

end
