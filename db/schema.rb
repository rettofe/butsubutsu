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

ActiveRecord::Schema[7.0].define(version: 2024_10_03_074609) do
  create_table "installs", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "items", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "category_id", null: false
    t.integer "condition_id", null: false
    t.integer "delivery_id", null: false
    t.integer "address_id", null: false
    t.integer "day_id", null: false
    t.integer "price", null: false
    t.bigint "user_id", null: false
    t.boolean "tradeable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "trades", charset: "utf8", force: :cascade do |t|
    t.bigint "item1_id", null: false
    t.bigint "item2_id", null: false
    t.bigint "user1_id", null: false
    t.bigint "user2_id", null: false
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item1_id"], name: "index_trades_on_item1_id"
    t.index ["item2_id"], name: "index_trades_on_item2_id"
    t.index ["user1_id"], name: "index_trades_on_user1_id"
    t.index ["user2_id"], name: "index_trades_on_user2_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "nickname", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.date "birthday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "users"
  add_foreign_key "trades", "items", column: "item1_id"
  add_foreign_key "trades", "items", column: "item2_id"
  add_foreign_key "trades", "users", column: "user1_id"
  add_foreign_key "trades", "users", column: "user2_id"
end
