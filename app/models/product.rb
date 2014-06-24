class Product < ActiveRecord::Base
	belongs_to :category

	 has_many :cart_items
	 before_destroy :no_cart_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

      def no_cart_item
      if cart_items.empty?
        return true
      else
        errors.add(:base, 'There are products in the cart')
        return false
      end
    end
end
