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

ActiveRecord::Schema.define(version: 2018_12_05_174513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eventbrite_categories", force: :cascade do |t|
    t.string "name"
    t.string "name_slug"
    t.string "img_url"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "event_start"
    t.datetime "event_end"
    t.string "location"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "latitude"
    t.string "longitude"
    t.string "img_url"
    t.index ["trip_id"], name: "index_events_on_trip_id"
  end

  create_table "foursquare_categories", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.string "category_id"
    t.string "sub_categories", default: [], array: true
  end

  create_table "trips", force: :cascade do |t|
    t.string "city"
    t.date "start_day"
    t.date "end_day"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "open_start"
    t.string "open_end"
    t.string "location"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "img_url"
    t.string "facebook"
    t.string "phone"
    t.string "instagram"
    t.string "category_tag"
    t.string "web_url"
    t.string "price_tier"
    t.string "likes"
    t.string "rating"
    t.string "days_hours", default: [], array: true
    t.index ["trip_id"], name: "index_venues_on_trip_id"
  end

  add_foreign_key "events", "trips"
  add_foreign_key "trips", "users"
  add_foreign_key "venues", "trips"
end
