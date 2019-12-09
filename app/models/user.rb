class User < ApplicationRecord
  has_secure_password
  has_many :movie_logs
  has_many :movies, through: :movie_log
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
