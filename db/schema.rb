# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_16_063604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "content_name"
    t.string "author_name"
    t.jsonb "images_urls", default: []
    t.integer "year"
    t.jsonb "images", default: []
    t.integer "int_id"
    t.string "category"
    t.jsonb "genres", default: []
    t.string "copyright"
    t.string "title"
    t.jsonb "wikipedia", default: {}
    t.float "average_rating"
    t.jsonb "goodreads", default: {}
    t.jsonb "similar_books", default: []
    t.string "description"
    t.string "loc_class"
    t.jsonb "gutenberg", default: {}
    t.jsonb "authors", default: []
    t.string "language"
    t.jsonb "countries", default: []
    t.datetime "release_date"
    t.integer "author"
    t.string "cover"
    t.boolean "content_cleaned", default: false
    t.jsonb "classes", default: []
    t.boolean "content_available", default: false
    t.integer "n_authors"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "website"
    t.integer "company_size"
    t.text "timezone"
    t.integer "category"
    t.text "internal_note"
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users"
end
