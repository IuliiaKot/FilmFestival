# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160905215538) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_films", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "film_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_films_on_category_id"
    t.index ["film_id"], name: "index_category_films_on_film_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "films", force: :cascade do |t|
    t.string   "title",       null: false
    t.integer  "year"
    t.string   "released"
    t.string   "runtime"
    t.string   "director",    null: false
    t.string   "writer"
    t.string   "poster"
    t.text     "plot",        null: false
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_films_on_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "rating",     null: false
    t.integer  "film_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id", "user_id"], name: "index_reviews_on_film_id_and_user_id", unique: true
    t.index ["film_id"], name: "index_reviews_on_film_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                    null: false
    t.string   "email",                       null: false
    t.string   "first_name",                  null: false
    t.string   "password_digest",             null: false
    t.integer  "role",            default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["email", "username"], name: "index_users_on_email_and_username", unique: true
  end

end
