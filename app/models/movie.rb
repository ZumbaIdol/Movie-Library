class Movie < ApplicationRecord
  has_many :users
  has_many :comments, through: :users
  validates :title, :category, :rating, presence: true
end
