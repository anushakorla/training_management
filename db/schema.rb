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

ActiveRecord::Schema.define(version: 20160608062428) do

  create_table "admins", force: :cascade do |t|
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

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "attachments", force: :cascade do |t|
    t.string   "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "level_id"
  end

  add_index "attachments", ["level_id"], name: "index_attachments_on_level_id"

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.string   "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "program_id"
    t.date     "start_date"
    t.date     "end_date"
  end

  add_index "levels", ["program_id"], name: "index_levels_on_program_id"

  create_table "programs", force: :cascade do |t|
    t.string   "language"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "submits", force: :cascade do |t|
    t.string   "title"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "test_id"
    t.integer  "user_id"
  end

  add_index "submits", ["test_id"], name: "index_submits_on_test_id"
  add_index "submits", ["user_id"], name: "index_submits_on_user_id"

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "duration"
    t.string   "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "level_id"
  end

  add_index "tests", ["level_id"], name: "index_tests_on_level_id"

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
