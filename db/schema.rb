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

ActiveRecord::Schema.define(version: 20180303163713) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "team_key",   limit: 4
    t.text     "body",       limit: 65535
  end

  create_table "competitions", primary_key: "key", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name",       limit: 255
    t.string   "location",   limit: 255
    t.text     "teams",      limit: 65535
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "team_key",   limit: 255
    t.string   "match_key",  limit: 255
    t.boolean  "success"
    t.integer  "start_time", limit: 4
    t.integer  "end_time",   limit: 4
    t.text     "extra",      limit: 65535
    t.text     "goal",       limit: 65535
  end

  create_table "matches", primary_key: "key", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "blue1",           limit: 4
    t.integer  "blue2",           limit: 4
    t.integer  "blue3",           limit: 4
    t.integer  "red1",            limit: 4
    t.integer  "red2",            limit: 4
    t.integer  "red3",            limit: 4
    t.string   "competition_key", limit: 255
    t.datetime "start_time"
    t.integer  "match_number",    limit: 4
  end

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "team_key",          limit: 4
    t.string   "picture_type",      limit: 255
    t.datetime "taken_at"
    t.string   "data_file_name",    limit: 255
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.datetime "data_updated_at"
  end

  create_table "teams", primary_key: "key", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "number",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
