json.array!(@orders) do |order|
  json.extract! order, :id, :name, :country, :province_state, :city, :postal_code, :address1, :address2, :email, :pay_type
  json.url order_url(order, format: :json)
end
