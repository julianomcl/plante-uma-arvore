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

ActiveRecord::Schema.define(version: 20171206022300) do

  create_table "locals", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.decimal  "latitude",   precision: 9, scale: 7
    t.decimal  "longitude",  precision: 9, scale: 7
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["user_id"], name: "index_locals_on_user_id"
  end

  create_table "trees", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.decimal  "latitude",   precision: 9, scale: 7
    t.decimal  "longitude",  precision: 9, scale: 7
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["user_id", "created_at"], name: "index_trees_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_trees_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "mobile"
    t.date     "birthday"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "telegram"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
