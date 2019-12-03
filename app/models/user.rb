class User < ApplicationRecord
  has_secure_password
  has_many :movies
  has_many :comments, through: :movie_log
  validates :name, :email, presence: true, uniqueness: true
end
