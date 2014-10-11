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

ActiveRecord::Schema.define(version: 20141011082753) do

  create_table "home_page", force: true do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "facebook"
    t.string   "twitter"
    t.text     "promotional_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promoted_page_id"
  end

  create_table "illustrations", force: true do |t|
    t.integer  "illustratable_id"
    t.string   "illustratable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "illustration_file_name"
    t.string   "illustration_content_type"
    t.integer  "illustration_file_size"
    t.datetime "illustration_updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "description"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_order", default: 1
  end

  create_table "price_categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_order", default: 1
  end

  create_table "users", force: true do |t|
    t.integer  "sign_in_count",      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.boolean  "administrator",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "description"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price_category_id"
    t.decimal  "economy_rating",     precision: 2, scale: 1, default: 0.0
    t.integer  "display_order",                              default: 1
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
