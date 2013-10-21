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

ActiveRecord::Schema.define(version: 20131021202615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: true do |t|
    t.string   "name",                                                   null: false
    t.string   "itunes_id",                                              null: false
    t.string   "itunes_url",                                             null: false
    t.string   "icon_url",                                               null: false
    t.string   "developer",                                              null: false
    t.string   "developer_url",                                          null: false
    t.decimal  "price",                          precision: 6, scale: 2, null: false
    t.text     "description",                                            null: false
    t.decimal  "current_rating",                 precision: 2, scale: 1, null: false
    t.integer  "current_rating_count",                                   null: false
    t.decimal  "total_rating",                   precision: 2, scale: 1, null: false
    t.integer  "total_rating_count",   limit: 8,                         null: false
    t.string   "category",                                               null: false
    t.boolean  "game_center_enabled"
    t.boolean  "is_universal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screenshots", force: true do |t|
    t.string   "screenshot_url"
    t.string   "ipad_screenshot_url"
    t.integer  "app_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "screenshots", ["app_id"], name: "index_screenshots_on_app_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
