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

ActiveRecord::Schema.define(version: 20140708085723) do

  create_table "actions", force: true do |t|
    t.string   "controller"
    t.string   "action"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "body_classes", force: true do |t|
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

  create_table "business_companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_infos", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_assesses", force: true do |t|
    t.integer  "car_info_id"
    t.string   "assess_appearance"
    t.string   "assess_skeletons"
    t.string   "assess_interior"
    t.string   "assess_engine"
    t.string   "assess_transmission"
    t.string   "assess_comprehensive"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_configurations", force: true do |t|
    t.integer  "car_info_id"
    t.string   "standard"
    t.string   "safety"
    t.string   "comfort"
    t.string   "function"
    t.string   "other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_infos", force: true do |t|
    t.integer  "car_no"
    t.string   "saletype"
    t.string   "brand"
    t.string   "series"
    t.string   "vin"
    t.string   "engineid"
    t.string   "platenumber"
    t.string   "models"
    t.string   "ownername"
    t.string   "ownerphone"
    t.string   "newsfrom"
    t.integer  "cooperation_id"
    t.string   "location"
    t.string   "rating"
    t.decimal  "customer_offer",     precision: 20, scale: 2
    t.decimal  "evaluate_price",     precision: 20, scale: 2
    t.decimal  "procurement_price",  precision: 20, scale: 2
    t.decimal  "newcar_price",       precision: 20, scale: 2
    t.decimal  "suggested_price",    precision: 20, scale: 2
    t.decimal  "maintenance_budget", precision: 20, scale: 2
    t.decimal  "selllimit_price",    precision: 20, scale: 2
    t.decimal  "price_hand",         precision: 20, scale: 2
    t.string   "description"
    t.integer  "status"
    t.integer  "user_id"
    t.datetime "addtime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_nos", force: true do |t|
    t.integer  "no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_photos", force: true do |t|
    t.integer  "car_info_id"
    t.integer  "photo_style"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "car_properties", force: true do |t|
    t.integer  "car_info_id"
    t.string   "transmission"
    t.string   "cc"
    t.string   "cc_unit"
    t.integer  "transfer_number"
    t.datetime "production_date"
    t.datetime "registration_date"
    t.string   "registration_province"
    t.string   "registration_city"
    t.string   "registration_district"
    t.decimal  "mileage",               precision: 10, scale: 2
    t.decimal  "maintenance_mileage",   precision: 10, scale: 2
    t.string   "color"
    t.string   "interior_color"
    t.string   "body_class"
    t.string   "emission_standard"
    t.integer  "with_plate_number"
    t.string   "use_nature"
    t.string   "insurance_info"
    t.datetime "inspection_expire"
    t.datetime "compulsory_expire"
    t.string   "compulsory_company"
    t.string   "business_info"
    t.datetime "business_expire"
    t.string   "business_company"
    t.string   "insurance_record"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cc_units", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comforts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compulsory_companies", force: true do |t|
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

  create_table "emission_standards", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interior_colors", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsfroms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_logs", force: true do |t|
    t.integer  "car_info_id"
    t.string   "describe"
    t.string   "reason"
    t.datetime "addtime"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "safeties", force: true do |t|
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

  create_table "standards", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transmissions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "use_natures", force: true do |t|
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
