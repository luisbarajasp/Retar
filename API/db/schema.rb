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

ActiveRecord::Schema.define(version: 20180104005902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "status"
    t.string "reference"
    t.integer "number"
    t.datetime "scheduled"
    t.integer "attendance"
    t.integer "utc_offset"
    t.string "entry_mode"
    t.text "weather"
    t.string "broadcast"
    t.string "venue_id"
    t.string "home_id"
    t.string "away_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_games_on_id", unique: true
  end

  create_table "periods", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "period_type"
    t.integer "number"
    t.integer "sequence"
    t.integer "home_points"
    t.integer "away_points"
    t.bigint "score_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_periods_on_id", unique: true
    t.index ["score_id"], name: "index_periods_on_score_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "home_points"
    t.integer "away_points"
    t.string "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_scores_on_game_id"
  end

  create_table "teams", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "name"
    t.string "alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_teams_on_id", unique: true
  end

  create_table "venues", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip"
    t.text "address"
    t.integer "capacity"
    t.string "surface"
    t.string "roof_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_venues_on_id", unique: true
  end

  add_foreign_key "periods", "scores"
end
