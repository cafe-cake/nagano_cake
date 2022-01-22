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

<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 2022_01_18_075517) do

  create_table "addresses", force: :cascade do |t|
=======
ActiveRecord::Schema.define(version: 2022_01_17_033854) do

  create_table "addresses", force: :cascade do |t|
    t.integer "member_id"
>>>>>>> Stashed changes
    t.string "name"
    t.string "post_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< Updated upstream
=======
    t.index ["member_id"], name: "index_addresses_on_member_id"
>>>>>>> Stashed changes
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
<<<<<<< Updated upstream
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
    t.integer "member_id"
    t.integer "item_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_cart_items_on_item_id"
    t.index ["member_id"], name: "index_cart_items_on_member_id"
>>>>>>> Stashed changes
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_orders", force: :cascade do |t|
<<<<<<< Updated upstream
=======
    t.integer "order_id"
    t.integer "item_id"
>>>>>>> Stashed changes
    t.integer "price"
    t.integer "count"
    t.integer "making_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< Updated upstream
  end

  create_table "items", force: :cascade do |t|
=======
    t.index ["item_id"], name: "index_item_orders_on_item_id"
    t.index ["order_id"], name: "index_item_orders_on_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "genre_id"
>>>>>>> Stashed changes
    t.string "name"
    t.text "introduction"
    t.integer "price"
    t.string "image_id"
    t.integer "sales_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< Updated upstream
    t.integer "genre_id"
=======
    t.index ["genre_id"], name: "index_items_on_genre_id"
>>>>>>> Stashed changes
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "phone_number"
    t.string "post_number"
    t.string "address"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "orders", force: :cascade do |t|
<<<<<<< Updated upstream
=======
    t.integer "member_id"
>>>>>>> Stashed changes
    t.string "post_number"
    t.string "address"
    t.string "name"
    t.integer "postage"
    t.integer "total_payment"
    t.integer "payment_methods", default: 0
    t.integer "order_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< Updated upstream
=======
    t.index ["member_id"], name: "index_orders_on_member_id"
>>>>>>> Stashed changes
  end

end
