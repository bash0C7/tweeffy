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

ActiveRecord::Schema.define(version: 20130428155558) do

  create_table "admin_users", force: true do |t|
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tumblr_blogs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tumblr_blogs_tweet_users", id: false, force: true do |t|
    t.integer "tumblr_blog_id"
    t.integer "tweet_user_id"
  end

  create_table "tweet_users", force: true do |t|
    t.string   "name"
    t.decimal  "latest_crawled_tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
