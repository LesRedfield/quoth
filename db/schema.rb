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

ActiveRecord::Schema.define(version: 20161204150805) do

  create_table "conditions", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "cost",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "quote_conditions", force: :cascade do |t|
    t.integer  "quote_id",     null: false
    t.integer  "condition_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "quote_conditions", ["condition_id"], name: "index_quote_conditions_on_condition_id"
  add_index "quote_conditions", ["quote_id"], name: "index_quote_conditions_on_quote_id"

  create_table "quotes", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "city"
    t.integer  "state_id",                           null: false
    t.integer  "age",                                null: false
    t.string   "gender",                             null: false
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "quotes", ["state_id"], name: "index_quotes_on_state_id"

  create_table "states", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "east_coast", default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
