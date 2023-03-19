class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true, email: true
end
