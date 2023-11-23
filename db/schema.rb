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

ActiveRecord::Schema[7.1].define(version: 2023_11_11_073524) do
  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_categorizations_on_category_id"
    t.index ["product_id", "category_id"], name: "index_categorizations_on_product_id_and_category_id", unique: true
    t.index ["product_id"], name: "index_categorizations_on_product_id"
  end

  create_table "price_entries", force: :cascade do |t|
    t.integer "store_id", null: false
    t.integer "product_id", null: false
    t.string "currency", default: "BGN", null: false
    t.integer "price_cents", null: false
    t.integer "promo_price_cents"
    t.datetime "promo_price_active_from"
    t.datetime "promo_price_active_to"
    t.boolean "archived", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_price_entries_on_product_id"
    t.index ["store_id", "product_id"], name: "index_price_entries_on_store_id_and_product_id", unique: true
    t.index ["store_id"], name: "index_price_entries_on_store_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "brand"
    t.integer "barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.text "description"
  end

  add_foreign_key "categorizations", "categories"
  add_foreign_key "categorizations", "products"
  add_foreign_key "price_entries", "products"
  add_foreign_key "price_entries", "stores"
end
