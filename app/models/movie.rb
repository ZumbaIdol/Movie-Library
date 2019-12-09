class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, through: :movie_log
  validates :title, :category, :rating, presence: true
  scope :long_titles, ->(n) { where("LENGTH(title) > ?", n) }
  scope :rating, ->(r) { where(rating: 'r') }
end
