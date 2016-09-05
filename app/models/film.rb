class Film < ApplicationRecord
  has_many :category_films
  has_many :category, through: :category_films

  has_many :reviews

end
