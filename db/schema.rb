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

ActiveRecord::Schema.define(version: 20151006070138) do

  create_table "mmember", primary_key: "uid", force: true do |t|
    t.string   "email1",                 limit: 256
    t.text     "email2"
    t.text     "passwd"
    t.integer  "memstate",                           default: 1
    t.date     "regdate"
    t.text     "nname"
    t.string   "corporation",            limit: 1
    t.integer  "byear",                              default: 0
    t.integer  "bmon",                               default: 0
    t.integer  "sex",                                default: 0
    t.text     "addr1"
    t.text     "addr2"
    t.text     "addr3"
    t.text     "job"
    t.integer  "marry",                              default: 0
    t.integer  "ref",                                default: 0
    t.integer  "service"
    t.text     "url1"
    t.text     "url2"
    t.text     "url3"
    t.text     "url4"
    t.text     "url5"
    t.datetime "last_login_date",                                  null: false
    t.string   "basic_flg",              limit: 1,   default: "0"
    t.string   "oauth",                  limit: 1,   default: "0"
    t.string   "id_facebook"
    t.string   "id_twitter"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.string   "yahoojp_id"
    t.string   "mail_magazine_flg",                  default: "1"
  end

  add_index "mmember", ["confirmation_token"], name: "confirmation_token", unique: true, using: :btree
  add_index "mmember", ["email1"], name: "email1", length: {"email1"=>128}, using: :btree
  add_index "mmember", ["facebook_id"], name: "idx_facebook_id", using: :btree
  add_index "mmember", ["id_facebook"], name: "idx_id_facebook", using: :btree
  add_index "mmember", ["id_twitter"], name: "idx_id_twitter", using: :btree
  add_index "mmember", ["reset_password_token"], name: "reset_password_token", unique: true, using: :btree
  add_index "mmember", ["twitter_id"], name: "idx_twitter_id", using: :btree

end
