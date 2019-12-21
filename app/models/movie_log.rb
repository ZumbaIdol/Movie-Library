class MovieLog < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :comments, presence: :true

  def name
    "#{user.name}'s comment on #{movie.title}"
  end


end
