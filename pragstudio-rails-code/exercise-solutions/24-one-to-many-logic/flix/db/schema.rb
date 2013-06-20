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

ActiveRecord::Schema.define(version: 20121217184756) do

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

  create_table "reviews", force: true do |t|
    t.string   "name"
    t.integer  "stars"
    t.text     "comment"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id"

end
