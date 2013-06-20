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
    migration 20121121163535, "", ""
    migration 20121121180707, "", ""
    migration 20121210234158, "5530762928e64c6c779ccff1c6f9dfed", "add_more_fields_to_movies"
  end

  create_table "movies", force: true do |t|
    t.string   "title"
    t.string   "rating"
    t.decimal  "total_gross"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.date     "released_on"
    t.string   "cast"
    t.string   "director"
    t.string   "duration"
    t.string   "image_file_name"
  end

end
