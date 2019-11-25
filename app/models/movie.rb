class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, through: :users
  validates :title, :category, :rating, presence: true
end
