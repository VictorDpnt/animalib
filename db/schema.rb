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

ActiveRecord::Schema[7.1].define(version: 2024_06_03_143619) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "specie"
    t.string "breed"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_animals_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.bigint "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reason"
    t.index ["animal_id"], name: "index_bookings_on_animal_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "health_records", force: :cascade do |t|
    t.bigint "animal_id", null: false
    t.bigint "booking_id", null: false
    t.string "history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_health_records_on_animal_id"
    t.index ["booking_id"], name: "index_health_records_on_booking_id"
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
    t.string "address"
    t.string "phone_number"
    t.string "profession"
    t.string "company_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "animals", "users"
  add_foreign_key "bookings", "animals"
  add_foreign_key "bookings", "users"
  add_foreign_key "health_records", "animals"
  add_foreign_key "health_records", "bookings"
end
