class Category < ApplicationRecord
  has_many :category_films
  has_many :films, through: :category_films

  validates :name, presence: true, uniqueness: true
end
