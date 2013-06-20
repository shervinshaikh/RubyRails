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

ActiveRecord::Schema.define do

  migrations do
    migration 20121121153536, "2846dd7cff84e1a48d3d86cdbf409e04", "create_events"
    migration 20121121175436, "49253e0c39f5dc72557d2fb4e1316b78", "add_fields_to_events"
    migration 20121210230623, "5c1acde5fb4916a71e581c3891469ecf", "add_image_file_and_capacity_to_events"
    migration 20121214204822, "28b4be0d866426f9feabb89bb6975ce4", "create_registrations"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "starts_at"
    t.text     "description"
    t.string   "image_file_name"
    t.integer  "capacity",        default: 1
  end

  create_table "registrations", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "how_heard"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["event_id"], name: "index_registrations_on_event_id"

end
