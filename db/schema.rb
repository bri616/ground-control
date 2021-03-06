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

ActiveRecord::Schema.define(version: 20150222225151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "light_directives", force: true do |t|
    t.string   "name"
    t.text     "icon_url"
    t.string   "icon_creator_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_entries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teleporter_id"
    t.boolean  "sound_on"
    t.boolean  "lights_on"
    t.string   "light_directive"
  end

  create_table "mission_settings", force: true do |t|
    t.string   "light_directive"
    t.string   "sound_directive"
    t.integer  "teleporter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sound_pattern_id"
  end

  create_table "sound_patterns", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sound_patterns_sounds", id: false, force: true do |t|
    t.integer "sound_pattern_id"
    t.integer "sound_id"
  end

  create_table "sounds", force: true do |t|
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "state_settings", force: true do |t|
    t.boolean  "lights_on"
    t.integer  "teleporter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sound_on",      default: false
    t.boolean  "power_off",     default: false
  end

  create_table "teleporters", force: true do |t|
    t.string   "name"
    t.text     "uid"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "rank"
    t.string   "password_digest"
    t.string   "recovery_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
