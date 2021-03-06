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

ActiveRecord::Schema.define(version: 20160402144606) do

  create_table "help_requests", force: :cascade do |t|
    t.string   "title"
    t.integer  "category"
    t.integer  "creator_id"
    t.datetime "deadline"
    t.integer  "status"
    t.integer  "assistant_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "help_requests", ["assistant_id"], name: "index_help_requests_on_assistant_id"
  add_index "help_requests", ["creator_id"], name: "index_help_requests_on_creator_id"

  create_table "help_responses", force: :cascade do |t|
    t.integer  "responder_id"
    t.integer  "help_request_id"
    t.text     "comment"
    t.boolean  "viewed_by_requestor"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "help_responses", ["help_request_id"], name: "index_help_responses_on_help_request_id"
  add_index "help_responses", ["responder_id"], name: "index_help_responses_on_responder_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
