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

ActiveRecord::Schema.define(version: 20180126233438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentication_tokens", force: :cascade do |t|
    t.string "encrypted_token"
    t.string "fb_token"
    t.string "user_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_token_iv"
    t.text "encrypted_token_bidx"
    t.index ["encrypted_token_bidx"], name: "index_authentication_tokens_on_encrypted_token_bidx"
  end

  create_table "categories", id: false, force: :cascade do |t|
    t.string "country_code", default: "", null: false
    t.string "name"
    t.string "sport_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_code"], name: "index_categories_on_country_code", unique: true
  end

  create_table "conferences", id: false, force: :cascade do |t|
    t.string "alias", default: "", null: false
    t.string "name"
    t.string "league_alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alias"], name: "index_conferences_on_alias", unique: true
  end

  create_table "divisions", id: false, force: :cascade do |t|
    t.string "alias", default: "", null: false
    t.string "name"
    t.string "conference_alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alias"], name: "index_divisions_on_alias", unique: true
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "reference"
    t.string "user_username"
    t.string "friend_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", id: false, force: :cascade do |t|
    t.string "id", default: "", null: false
    t.string "status"
    t.integer "number"
    t.datetime "scheduled"
    t.integer "attendance"
    t.text "weather"
    t.string "winner_id"
    t.string "current_period"
    t.integer "clock"
    t.string "week_id"
    t.string "home_id"
    t.string "away_id"
    t.string "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_games_on_id", unique: true
  end

  create_table "leagues", id: false, force: :cascade do |t|
    t.string "alias", default: "", null: false
    t.string "name"
    t.string "category_country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alias"], name: "index_leagues_on_alias", unique: true
  end

  create_table "periods", id: false, force: :cascade do |t|
    t.string "id", default: "", null: false
    t.integer "home_points"
    t.integer "away_points"
    t.string "type"
    t.integer "number"
    t.bigint "score_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_periods_on_id", unique: true
    t.index ["score_id"], name: "index_periods_on_score_id"
  end

  create_table "retados", force: :cascade do |t|
    t.integer "status", default: 0
    t.bigint "reto_id"
    t.string "user_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reto_id"], name: "index_retados_on_reto_id"
  end

  create_table "retos", force: :cascade do |t|
    t.text "description"
    t.string "winner"
    t.string "retador_pick"
    t.integer "maximum_to", default: 1
    t.decimal "bet"
    t.datetime "scheduled_at"
    t.integer "duration"
    t.datetime "began_at"
    t.string "status", default: "scheduled"
    t.string "retador_username"
    t.string "judge_username"
    t.string "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "finished_at"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "home_points"
    t.integer "away_points"
    t.string "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", id: false, force: :cascade do |t|
    t.string "id", default: "", null: false
    t.string "name"
    t.string "type"
    t.date "start_date"
    t.date "end_date"
    t.string "year"
    t.string "league_alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_seasons_on_id", unique: true
  end

  create_table "sports", id: false, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sports_on_name", unique: true
  end

  create_table "teams", id: false, force: :cascade do |t|
    t.string "id", default: "", null: false
    t.string "name"
    t.string "market"
    t.string "alias"
    t.string "division_alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_teams_on_id", unique: true
  end

  create_table "users", id: false, force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "fb_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "venues", id: false, force: :cascade do |t|
    t.string "id", default: "", null: false
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip"
    t.string "address"
    t.string "map_coordinates"
    t.integer "capacity"
    t.string "surface"
    t.string "roof_type"
    t.string "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_venues_on_id", unique: true
  end

  create_table "weeks", id: false, force: :cascade do |t|
    t.string "id", default: "", null: false
    t.string "title"
    t.integer "sequence"
    t.string "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_weeks_on_id", unique: true
  end

  add_foreign_key "periods", "scores"
  add_foreign_key "retados", "retos"
end
