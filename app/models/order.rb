class Order < ActiveRecord::Base
has_many :cart_items, dependent: :destroy

	PAYMENT_TYPES = [ "Mastercard", "Visa", "PayPal", "Check" ]

	COUNTRIES = [ "Canada", "United States"]

	PROVINCE_STATES = [ "Alberta", "British Columbia", "Manitoba", 
		"New Brunswick", "Newfoundland and Labrador", 
		"Nova Scotia", "Ontario", "Prince Edward Island", "Quebec", 
		"Saskatchewan", "Northwest Territories", "Nunavut", "Yukon", 
		"Visa", "Alabama", "Alaska", "Arizona", "Arkansas", 
		"California", "Colorado", "Connecticut", "Delaware", 
		"Florida", "Georgia", "Hawaii", "Idaho", "Illinois", 
		"Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
		"Maine", "Maryland", "Massachusetts", "Michigan", 
		"Minnesota", "Mississippi", "Missouri", "Montana", 
		"Nebraska", "Nevada", "New Hampshire", "New Jersey", 
		"New Mexico", "New York", "North Carolina", "North Dakota", 
		"Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", 
		"South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", 
		"Vermont", "Virginia", "Washington", "West Virginia", 
		"Wisconsin", "Wyoming"]


validates :name, :city, :postal_code, :address1, :email, presence: true
validates :pay_type, inclusion: PAYMENT_TYPES
validates :country, inclusion: COUNTRIES
validates :province_state, inclusion: PROVINCE_STATES

def get_cart_items(cart)
	cart.cart_items.each do |item|
		item.cart_id = nil
		cart_items << item
		end
	end
	
end
