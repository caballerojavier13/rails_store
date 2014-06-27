class Order < ActiveRecord::Base
has_many :cart_items, dependent: :destroy

	PAYMENT_TYPES = [ "Mastercard", "Visa", "PayPal", "Check" ]

	COUNTRIES = ["Canada", "United States", "Andorra", "Austria", 
		"Belgium", "Bulgaria", "Croatia", "Czech Republic", "Denmark", 
		"Dominican Republic", "Estonia", "Finland", "France", 
		"Germany", "Greece", "Hong Kong", "Hungary", "India", 
		"Ireland", "Israel", "Italy", "Japan", "Latvia", 
		"Liechtenstein", "Lithuania", "Luxembourg", "Malaysia", "Monaco", 
		"Netherlands", "Norway", "Philippines", "Poland", "Portugal", 
		"Puerto Rico", "Romania", "Saudi Arabia", "Singapore", "Slovakia",
		 "Slovenia", "South Africa", "South Korea", "Spain", "Sweden", 
		 "Switzerland", "Taiwan", "United Kingdom "]




validates :name, :city, :postal_code, :address1, :email, presence: true
validates :pay_type, inclusion: PAYMENT_TYPES
validates :country, inclusion: COUNTRIES


def get_cart_items(cart)
	cart.cart_items.each do |item|
		item.cart_id = nil
		cart_items << item
		end
	end
	
end
