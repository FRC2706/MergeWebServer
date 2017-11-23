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

ActiveRecord::Schema.define(version: 20171116014225) do

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "team_id",    limit: 4
    t.text     "body",       limit: 65535
  end

  create_table "competitions", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name",       limit: 255
    t.string   "location",   limit: 255
    t.binary   "teams",      limit: 65535
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "team_id",    limit: 255
    t.string   "goal_id",    limit: 255
    t.string   "match_id",   limit: 255
    t.boolean  "success"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "goals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "blue1",          limit: 4
    t.integer  "blue2",          limit: 4
    t.integer  "blue3",          limit: 4
    t.integer  "red1",           limit: 4
    t.integer  "red2",           limit: 4
    t.integer  "red3",           limit: 4
    t.integer  "competition_id", limit: 4
    t.datetime "start_time"
    t.integer  "match_number",   limit: 4
  end

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "team_id",    limit: 4
    t.string   "type",       limit: 255
    t.datetime "taken_at"
    t.string   "link",       limit: 255
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "number",     limit: 4
    t.integer  "opr",        limit: 4
    t.integer  "dpr",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", primary_key: "name", force: :cascade do |t|
    t.string "coolNum", limit: 20
  end

end
