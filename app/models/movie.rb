class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments through :users
  validate :title, :category, :rating, presence: true
end
