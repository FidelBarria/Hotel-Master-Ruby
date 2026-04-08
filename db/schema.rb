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

ActiveRecord::Schema[8.1].define(version: 2026_04_08_202934) do
  create_table "guests", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.datetime "created_at", null: false
    t.string "document_number", null: false
    t.string "email"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone"
    t.string "state"
    t.datetime "updated_at", null: false
    t.string "zip_code"
    t.index ["document_number"], name: "index_guests_on_document_number", unique: true
    t.index ["email"], name: "index_guests_on_email", unique: true
  end

  create_table "hotels", force: :cascade do |t|
    t.string "address"
    t.integer "category"
    t.string "city"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.integer "number_of_rooms"
    t.string "phone"
    t.string "state"
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.date "payment_date"
    t.integer "payment_method", null: false
    t.integer "reservation_id_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id_id"], name: "index_payments_on_reservation_id_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "check_in_date", null: false
    t.date "check_out_date", null: false
    t.datetime "created_at", null: false
    t.integer "guest_id", null: false
    t.integer "number_of_guest", null: false
    t.integer "room_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "total_price", precision: 10, scale: 2
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.string "description"
    t.integer "hotel_id"
    t.decimal "price_per_night"
    t.string "room_number"
    t.integer "room_type"
    t.integer "status"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "hotel_id"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "payments", "reservation_ids"
  add_foreign_key "reservations", "guests"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "users", "hotels", on_delete: :cascade
end
