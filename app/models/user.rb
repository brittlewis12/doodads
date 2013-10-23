class User < ActiveRecord::Base
  validates :first_name, :last_name, :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password
end