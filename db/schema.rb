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

ActiveRecord::Schema.define(version: 20141011035919) do

  create_table "home_page", force: true do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "picture"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "illustrations", force: true do |t|
    t.integer  "illustratable_id"
    t.string   "illustratable_type"
    t.string   "illustration"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "photo"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price_category_id"
    t.text     "body"
    t.decimal  "economy_rating",    precision: 2, scale: 1, default: 0.0
    t.integer  "seats",                                     default: 0
    t.string   "luggage_capacity"
    t.integer  "display_order",                             default: 1
  end

end
