class User < ApplicationRecord
  has_secure_password
  has_many :movies
  has_many :comments
  validates :name, :email, presence: true
end
