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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130912043100) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friends", :force => true do |t|
    t.integer  "requester_id"
    t.integer  "receiver_id"
    t.boolean  "approved",     :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "size"
    t.string   "color"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "price"
    t.integer  "category_id"
    t.integer  "points"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "share_id"
    t.integer  "stars"
    t.text     "comment"
    t.integer  "condition"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "lend_again",       :default => 1
    t.integer  "returned_on_time", :default => 1
  end

  create_table "shares", :force => true do |t|
    t.integer  "item_id"
    t.integer  "borrower_id"
    t.datetime "start_on"
    t.datetime "end_on"
    t.string   "status",          :default => "pending"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "pickup_location"
    t.string   "pickup_time"
    t.string   "return_location"
    t.string   "return_time"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.integer  "facebook_id",              :limit => 8
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "amt_borrowed",                          :default => 0
    t.integer  "amt_shared",                            :default => 0
    t.integer  "points",                                :default => 10
    t.integer  "avg_stars",                             :default => 0
    t.integer  "avg_condition",                         :default => 0
    t.integer  "percent_lend_again",                    :default => 0
    t.integer  "percent_returned_on_time",              :default => 0
    t.integer  "num_reviews",                           :default => 0
  end
end
