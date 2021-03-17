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

ActiveRecord::Schema.define(version: 2021_03_16_224242) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "emas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "direction"
    t.index ["stock_id"], name: "index_emas_on_stock_id"
    t.index ["user_id"], name: "index_emas_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tow_titre", array: true
  end

  create_table "hot_stocks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "direction"
    t.bigint "stock_id", null: false
    t.index ["stock_id"], name: "index_hot_stocks_on_stock_id"
    t.index ["user_id"], name: "index_hot_stocks_on_user_id"
  end

  create_table "my_positions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.integer "size"
    t.float "target"
    t.float "stop_loss"
    t.float "iceline"
    t.float "current_price"
    t.string "buy_sell"
    t.float "entry"
    t.float "r1"
    t.integer "remaining_size"
    t.boolean "r1_hit", default: false
    t.boolean "stop_loss_hit", default: false
    t.boolean "target_hit", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_my_positions_on_stock_id"
    t.index ["user_id"], name: "index_my_positions_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.integer "size"
    t.float "target"
    t.float "stop_loss"
    t.bigint "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.float "iceline"
    t.float "current_price"
    t.string "buy_sell"
    t.float "entry"
    t.float "r1"
    t.integer "remaining_size"
    t.boolean "r1_hit", default: false
    t.boolean "stop_loss_hit", default: false
    t.boolean "target_hit", default: false
    t.index ["stock_id"], name: "index_positions_on_stock_id"
    t.index ["user_id"], name: "index_positions_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "category"
    t.string "grade"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.text "description"
    t.string "category"
    t.float "equity", default: 0.0
    t.float "cash", default: 100000.0
    t.float "cash_plus_equity"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "emas", "stocks"
  add_foreign_key "emas", "users"
  add_foreign_key "hot_stocks", "users"
  add_foreign_key "my_positions", "stocks"
  add_foreign_key "my_positions", "users"
  add_foreign_key "positions", "stocks"
  add_foreign_key "positions", "users"
end
