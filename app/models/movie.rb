class Movie < ApplicationRecord
  has_many :movie_logs
  has_many :users, through: :movie_logs
  validates :title, :category, :rating, presence: true

  scope :most_comments, -> {(
    select("movies.id, movies.title, count(movies.id) as movie_count")
    .joins(:movie_logs)
    .group("movies.id")
    .order("movie_count DESC")
    .limit(1)
    )}
end