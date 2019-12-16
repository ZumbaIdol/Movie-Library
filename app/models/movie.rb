class Movie < ApplicationRecord
  has_many :movie_logs
  has_many :users, through: :movie_logs
  validates :title, presence: true
  # scope :long_titles, ->(n) { where("LENGTH(title) > ?", n) }
  # scope :rating, ->(r) { where(rating: 'r') }
end
