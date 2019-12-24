class User < ApplicationRecord
  has_secure_password
  has_many :movie_logs
  has_many :movies, through: :movie_logs
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    self.where(email: auth["info"]["email"]).first_or_create do |u|
      u.name = auth["info"]["name"]
      u.password = SecureRandom.hex
    end
  end
end
