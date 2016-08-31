class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :reviews

  validates :username,:email, :first_name, presence: true
  validates :password, presence:  true, length: { minimum: 6}
end
