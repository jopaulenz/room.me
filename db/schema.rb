# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_03_103416) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "dislikes", force: :cascade do |t|
    t.string "disliked_type", null: false
    t.bigint "disliked_id", null: false
    t.string "disliker_type", null: false
    t.bigint "disliker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disliked_type", "disliked_id"], name: "index_dislikes_on_disliked"
    t.index ["disliker_type", "disliker_id"], name: "index_dislikes_on_disliker"
  end

  create_table "flatmates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "gender"
    t.string "pronouns"
    t.string "email_address"
    t.string "phone_number"
    t.string "district"
    t.integer "rent_range_min"
    t.integer "rent_range_max"
    t.integer "duration"
    t.date "entry_date"
    t.integer "registration"
    t.integer "room_size_min"
    t.integer "room_size_max"
    t.integer "furnished"
    t.string "profile_picture_url"
    t.index ["user_id"], name: "index_flatmates_on_user_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "gender"
    t.string "pronouns"
    t.string "email_address"
    t.string "phone_number"
    t.string "district"
    t.integer "rent"
    t.integer "duration"
    t.date "entry_date"
    t.integer "registration"
    t.integer "room_size"
    t.integer "furnished"
    t.float "latitude"
    t.float "longitude"
    t.string "profile_picture_url"
    t.text "apartment_picture_urls", default: [], array: true
    t.string "address"
    t.string "street"
    t.string "postcode"
    t.string "country"
    t.index ["user_id"], name: "index_hosts_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "liked_type", null: false
    t.bigint "liked_id", null: false
    t.string "liker_type", null: false
    t.bigint "liker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["liked_type", "liked_id"], name: "index_likes_on_liked"
    t.index ["liker_type", "liker_id"], name: "index_likes_on_liker"
  end

  create_table "living_preferences", force: :cascade do |t|
    t.string "preferable_type"
    t.bigint "preferable_id"
    t.integer "cleanliness"
    t.integer "gender"
    t.integer "smoking"
    t.integer "partying"
    t.integer "age"
    t.integer "furnished"
    t.integer "dishwasher"
    t.integer "washingmaschine"
    t.integer "balcony"
    t.integer "kitchen"
    t.integer "bathtub"
    t.string "aboutme"
    t.string "interest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preferable_type", "preferable_id"], name: "index_living_preferences_on_preferable"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "flatmate_id", null: false
    t.bigint "host_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flatmate_id"], name: "index_matches_on_flatmate_id"
    t.index ["host_id"], name: "index_matches_on_host_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "message"
    t.bigint "match_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_messages_on_match_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_picture_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "flatmates", "users"
  add_foreign_key "hosts", "users"
  add_foreign_key "matches", "flatmates"
  add_foreign_key "matches", "hosts"
  add_foreign_key "messages", "matches"
  add_foreign_key "messages", "users"
end
