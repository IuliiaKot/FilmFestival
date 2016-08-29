class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.string :director, null: false
      t.string :poster
      t.text :plot, null: false
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
