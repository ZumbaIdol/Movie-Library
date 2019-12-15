class MovieLog < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :comments

  def name
    "#{user.name}'s comment on #{movie.title}"
  end
end
