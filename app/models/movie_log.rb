class MovieLog < ApplicationRecord
  belongs_to :user
  belongs_to :movie
end
