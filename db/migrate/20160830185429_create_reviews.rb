class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|

        t.text :content, null: false
        t.integer :rating, null: false
        t.references :film, index: true, foreign_key: true
        t.references :user, index: true, foreign_key: true

        t.timestamps null: false
    end
    add_index :reviews, [:film_id, :user_id], unique: true 
  end
end
