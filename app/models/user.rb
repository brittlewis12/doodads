class User < ActiveRecord::Base
  validates :first_name, :last_name, :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password

  has_many :follows
  has_many :followed_apps, through: :follows, source: :app

  has_many :doodads
  has_many :doodaded_apps, through: :doodads, source: :app
end