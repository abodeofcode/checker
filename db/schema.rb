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

ActiveRecord::Schema.define(version: 20150823213350) do

  create_table "locations", force: :cascade do |t|
    t.string   "lat_lng",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "text",        limit: 255
    t.string   "status",      limit: 255
    t.boolean  "verified"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "phonenumber", limit: 255
    t.string   "message",     limit: 255
  end

  create_table "orders", force: :cascade do |t|
    t.string   "pickup",                limit: 255
    t.string   "drop",                  limit: 255
    t.datetime "pick_time"
    t.string   "vehicletype",           limit: 255
    t.string   "mobilenumber",          limit: 255
    t.string   "items",                 limit: 255
    t.integer  "labour",                limit: 4
    t.string   "couponused",            limit: 255
    t.boolean  "verified"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "pick_floor",            limit: 255
    t.string   "drop_floor",            limit: 255
    t.string   "drop_lift",             limit: 255
    t.string   "pick_lift",             limit: 255
    t.string   "pick_landmark",         limit: 255
    t.string   "drop_landmark",         limit: 255
    t.string   "drop_detailed_address", limit: 255
    t.string   "pick_detailed_address", limit: 255
  end

  create_table "promocodes", force: :cascade do |t|
    t.string   "codetext",       limit: 255
    t.integer  "timesused",      limit: 4
    t.integer  "discount_value", limit: 4
    t.boolean  "validity"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
