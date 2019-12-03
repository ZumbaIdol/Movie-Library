class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, through: :movie_log
  validates :title, :category, :rating, presence: true
end
