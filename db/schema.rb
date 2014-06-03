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

ActiveRecord::Schema.define(version: 20140603175343) do

  create_table "alert_histories", force: true do |t|
    t.boolean  "state",         default: false, null: false
    t.integer  "thermostat_id"
    t.integer  "alert_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_email"
    t.boolean  "active",        default: false, null: false
    t.integer  "user_id"
  end

  create_table "alerts", force: true do |t|
    t.date     "config_date"
    t.integer  "temperature"
    t.time     "interval"
    t.integer  "thermostat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "config_time_initial"
    t.time     "config_time_final"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "lastName"
    t.integer  "id_user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.string   "name"
    t.integer  "temperatures_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "thermostat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",         default: "ABIERTO", null: false
    t.string   "resolution",    default: "",        null: false
  end

  create_table "locations", force: true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "region"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "schedules", force: true do |t|
    t.string   "day"
    t.datetime "time"
    t.integer  "temperature"
    t.integer  "thermostat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temperatures", force: true do |t|
    t.integer  "basic_temp"
    t.integer  "thermostats_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thermostat_histories", force: true do |t|
    t.integer  "thermostat_id"
    t.integer  "temperature"
    t.integer  "humidity"
    t.integer  "consumption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thermostats", force: true do |t|
    t.integer  "serial_number"
    t.integer  "location_id"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "temperature"
    t.boolean  "configuration"
  end

  create_table "triples", force: true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "days_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rol",                    default: "Usuario", null: false
    t.boolean  "user_enable",            default: true,      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
