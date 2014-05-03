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

ActiveRecord::Schema.define(version: 20140503001859) do

  create_table "comments", force: true do |t|
    t.string   "body",          null: false
    t.integer  "user_id",       null: false
    t.string   "com_user_type", null: false
    t.integer  "com_user_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["com_user_id"], name: "index_comments_on_com_user_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "goals", force: true do |t|
    t.string   "title",                      null: false
    t.integer  "user_id",                    null: false
    t.string   "privacy"
    t.boolean  "completion", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username",      null: false
    t.string   "password",      null: false
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
