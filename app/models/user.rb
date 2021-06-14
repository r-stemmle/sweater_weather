class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :password_digest, presence: true
  validates :api_key, presence: true
end
