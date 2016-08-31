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

ActiveRecord::Schema.define(version: 20150421201931) do

  create_table "bookmarks", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
    t.string   "title"
  end

  create_table "notes", force: true do |t|
    t.datetime "date"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_name"
  end

  create_table "settings", force: true do |t|
    t.string   "background"
    t.integer  "fontSize"
    t.string   "fontColor"
    t.string   "fontFamily"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "password_digest"
    t.integer  "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weathers", force: true do |t|
    t.integer  "location"
    t.integer  "high"
    t.integer  "low"
    t.string   "condition"
    t.integer  "wind_speed"
    t.string   "loc_name"
    t.integer  "sunrise"
    t.integer  "sunset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
