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

ActiveRecord::Schema.define(version: 20150528202238) do

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
    t.integer  "region_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "funding_to_date",    default: 0
    t.integer  "funding_needed",     default: 0
  end

  add_index "businesses", ["region_id"], name: "index_businesses_on_region_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "business_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investments", ["business_id"], name: "index_investments_on_business_id", using: :btree
  add_index "investments", ["user_id"], name: "index_investments_on_user_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "region_id"
  end

  add_index "users", ["region_id"], name: "index_users_on_region_id", using: :btree

  add_foreign_key "business_categories", "businesses"
  add_foreign_key "business_categories", "categories"
  add_foreign_key "businesses", "regions"
  add_foreign_key "investments", "businesses"
  add_foreign_key "investments", "users"
  add_foreign_key "users", "regions"
end
