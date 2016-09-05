class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.integer :year
      t.string :released
      t.string :runtime
      t.string :director, null: false
      t.string :writer
      t.string :poster
      t.text :plot, null: false
      t.timestamps null: false
    end
  end
end
