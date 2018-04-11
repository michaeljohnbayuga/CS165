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

ActiveRecord::Schema.define(version: 20180411115333) do

  create_table "episodes", force: :cascade do |t|
    t.integer "episode_no"
    t.integer "showep_no"
    t.string "title"
    t.date "air_date"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_favorites_on_show_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "show_id"
    t.integer "season_no"
    t.integer "no_of_episodes"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_seasons_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "network"
    t.string "start_year"
    t.string "end_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.integer "episode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["episode_id"], name: "index_trackers_on_episode_id"
    t.index ["user_id"], name: "index_trackers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.boolean "is_admin", default: false
    t.string "password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
