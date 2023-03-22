class User < ApplicationRecord
  after_create :expire_cache
  after_destroy :expire_cache

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

 def expire_cache
   ActionController::Base.new.expire_fragment('table_of_users')
 end
end
