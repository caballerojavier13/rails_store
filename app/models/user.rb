class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password

   after_destroy :ensure_admin

   private 
   def ensure_admin
   	if User.count.zero?
   		raise "The last user cannot be deleted"
   	end
   end
end
