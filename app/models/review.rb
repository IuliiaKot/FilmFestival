class Review < ApplicationRecord
  belongs_to :film
  belongs_to :user

  has_many :comments
end
