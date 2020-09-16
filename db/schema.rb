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

ActiveRecord::Schema.define(version: 2020_09_16_170041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_pieces", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "piece_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_favorite_pieces_on_piece_id"
    t.index ["user_id"], name: "index_favorite_pieces_on_user_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "composer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "user_id"
    t.text "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "tips", force: :cascade do |t|
    t.integer "difficulty_rating"
    t.text "tip"
    t.bigint "piece_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_tips_on_piece_id"
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "uid"
    t.string "access_token"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.text "about_me"
  end

  add_foreign_key "favorite_pieces", "pieces"
  add_foreign_key "favorite_pieces", "users"
  add_foreign_key "skills", "users"
  add_foreign_key "tips", "pieces"
  add_foreign_key "tips", "users"
end
