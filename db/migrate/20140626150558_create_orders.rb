class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :country
      t.string :province_state
      t.string :city
      t.string :postal_code
      t.text :address1
      t.text :address2
      t.string :email
      t.string :pay_type

      t.timestamps
    end
  end
end
