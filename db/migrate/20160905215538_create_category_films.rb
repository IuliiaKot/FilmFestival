class CreateCategoryFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :category_films do |t|
      t.references :category, index: true, foreign_key: true
      t.references :film, index: true, foreign_key: true
      t.timestamps
    end
  end
end
