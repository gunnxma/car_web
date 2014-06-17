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

ActiveRecord::Schema.define(version: 20140617025800) do

  create_table "actions", force: true do |t|
    t.string   "controller"
    t.string   "action"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "initial"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cooperate_levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cooperate_relations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cooperate_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cooperations", force: true do |t|
    t.integer  "cooperate_type_id"
    t.string   "name"
    t.string   "rule"
    t.integer  "cooperate_relation_id"
    t.integer  "cooperate_level_id"
    t.string   "contact"
    t.string   "phone"
    t.datetime "period_start"
    t.datetime "period_end"
    t.string   "describe"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsfroms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saletypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", force: true do |t|
    t.integer  "brand_id"
    t.string   "initial"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transmissions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_powers", force: true do |t|
    t.integer  "user_id"
    t.integer  "action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "department_id"
    t.string   "name"
    t.string   "account"
    t.string   "pwd"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
