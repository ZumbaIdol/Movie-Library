class User < ApplicationRecord
  has_secure_password
  has_many :movie_logs
  has_many :movies, through: :movie_log
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end
end
