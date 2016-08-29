class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :firts_name, null: false
      t.string :password_digest, null: false
      t.integer :role, null: false, default: 0

      t.timestamps null: false
    end

    add_index :users, [:email, :username], unique: true
  end
end
