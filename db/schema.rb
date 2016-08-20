# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160814212857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "pinnings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "board_id"
  end

  add_index "pinnings", ["board_id"], name: "index_pinnings_on_board_id", using: :btree
  add_index "pinnings", ["pin_id"], name: "index_pinnings_on_pin_id", using: :btree
  add_index "pinnings", ["user_id"], name: "index_pinnings_on_user_id", using: :btree

  create_table "pins", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.text     "text"
    t.string   "slug"
    t.integer  "category_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  add_index "pins", ["category_id"], name: "index_pins_on_category_id", using: :btree
  add_index "pins", ["user_id"], name: "index_pins_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "boards", "users"
  add_foreign_key "pinnings", "pins"
  add_foreign_key "pinnings", "users"
  add_foreign_key "pins", "users"
end
