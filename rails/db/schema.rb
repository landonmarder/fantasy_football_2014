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

ActiveRecord::Schema.define(version: 20140706152552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: true do |t|
    t.string   "name",       null: false
    t.string   "team",       null: false
    t.string   "position",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projections", force: true do |t|
    t.integer  "player_id",            null: false
    t.integer  "passing_completions"
    t.integer  "passing_attempts"
    t.integer  "passing_yards"
    t.integer  "passing_tds"
    t.integer  "interceptions"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_tds"
    t.integer  "receiving_yards"
    t.integer  "receiving_receptions"
    t.integer  "receiving_tds"
    t.integer  "fumbles"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source",               null: false
  end

end
