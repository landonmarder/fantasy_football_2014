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

ActiveRecord::Schema.define(version: 20140817174558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "costs", force: true do |t|
    t.integer  "player_id",  null: false
    t.float    "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "adp"
  end

  create_table "players", force: true do |t|
    t.string   "name",       null: false
    t.string   "team",       null: false
    t.string   "position",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projections", force: true do |t|
    t.integer  "player_id",            null: false
    t.float    "passing_completions"
    t.float    "passing_attempts"
    t.float    "passing_yards"
    t.float    "passing_tds"
    t.float    "interceptions"
    t.float    "rushing_attempts"
    t.float    "rushing_yards"
    t.float    "rushing_tds"
    t.float    "receiving_yards"
    t.float    "receiving_receptions"
    t.float    "receiving_tds"
    t.float    "fumbles"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source",               null: false
  end

end
