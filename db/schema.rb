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

ActiveRecord::Schema.define(version: 20150520223457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_categories", force: :cascade do |t|
    t.integer "business_id"
    t.integer "category_id"
  end

  add_index "business_categories", ["business_id"], name: "index_business_categories_on_business_id", using: :btree
  add_index "business_categories", ["category_id"], name: "index_business_categories_on_category_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "funding_needed"
    t.integer  "region_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "businesses", ["region_id"], name: "index_businesses_on_region_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "business_id"
    t.integer "amount"
  end

  add_index "investments", ["business_id"], name: "index_investments_on_business_id", using: :btree
  add_index "investments", ["user_id"], name: "index_investments_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.string   "image",       default: "https://browshot.com/static/images/not-found.png"
    t.boolean  "retired",     default: false
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  create_table "items_categories", force: :cascade do |t|
    t.integer "item_id"
    t.integer "category_id"
  end

  add_index "items_categories", ["category_id"], name: "index_items_categories_on_category_id", using: :btree
  add_index "items_categories", ["item_id"], name: "index_items_categories_on_item_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "quantity"
  end

  add_index "purchases", ["item_id"], name: "index_purchases_on_item_id", using: :btree
  add_index "purchases", ["order_id"], name: "index_purchases_on_order_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "regions", ["user_id"], name: "index_regions_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.string  "review"
    t.integer "score"
    t.string  "title"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "role",            default: 0
    t.string   "username",        default: "lender"
  end

  add_foreign_key "business_categories", "businesses"
  add_foreign_key "business_categories", "categories"
  add_foreign_key "businesses", "regions"
  add_foreign_key "investments", "businesses"
  add_foreign_key "investments", "users"
  add_foreign_key "items_categories", "categories"
  add_foreign_key "items_categories", "items"
  add_foreign_key "purchases", "items"
  add_foreign_key "purchases", "orders"
  add_foreign_key "regions", "users"
end
