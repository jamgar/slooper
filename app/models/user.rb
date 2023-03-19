class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
end
