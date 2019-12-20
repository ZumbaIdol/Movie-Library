class Movie < ApplicationRecord
  has_many :movie_logs
  has_many :users, through: :movie_logs
  validates :title, :category, :rating, presence: true
  
  scope :most_comments, -> {(
    select("movie.id, movie.title, count(movie.id) as movie_count")
    .joins(:comments)
    .group("movie.id")
    .order("movie_count DESC")
    .limit(10)
    )}
end
