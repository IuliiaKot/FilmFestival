class Film < ApplicationRecord
  has_many :category_films
  has_many :categories, through: :category_films

  has_many :reviews

end
