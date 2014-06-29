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

ActiveRecord::Schema.define(:version => 20140629131040) do

  create_table "houses", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.integer  "n_porches"
    t.integer  "n_floors"
    t.integer  "n_flats"
    t.integer  "n_occupants"
    t.boolean  "key"
    t.string   "code"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "fathername"
    t.string   "p_type"
    t.boolean  "house_head"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone"
    t.string   "email"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end
