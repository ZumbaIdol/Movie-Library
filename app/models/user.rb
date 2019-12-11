class User < ApplicationRecord
  has_secure_password
  has_many :movie_logs
  has_many :movies, through: :movie_log
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    # where(email: auth.info.email).first_or_initialize do |u|
    #   u.name = auth.info.name
    #   u.email = auth.info.email
    #   u.password = SecureRandom.hex
    where(email: auth[:info][:email]).first_or_create do |user|
      user.name = auth[:info][:name]
      user.email = auth[:info][:email]
    end
  end
end
