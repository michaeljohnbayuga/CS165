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

ActiveRecord::Schema.define(version: 20180222104326) do

  create_table "bedchecks", force: :cascade do |t|
    t.string "student_number"
    t.string "sa_name"
    t.string "guard_name"
    t.string "date"
    t.integer "dormer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dormer_id"], name: "index_bedchecks_on_dormer_id"
  end

  create_table "bedchecks_dormers", id: false, force: :cascade do |t|
    t.integer "dormer_id", null: false
    t.integer "bedcheck_id", null: false
  end

  create_table "dailyreports", force: :cascade do |t|
    t.string "report_id"
    t.string "student_number"
    t.string "status", default: "in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dormers", force: :cascade do |t|
    t.string "student_number"
    t.string "name"
    t.integer "room_number"
    t.string "sex"
    t.string "course_year"
    t.string "attachment"
    t.boolean "is_sa", default: false
    t.string "status", default: "in"
    t.integer "bedcheck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bedcheck_id"], name: "index_dormers_on_bedcheck_id"
  end

  create_table "guards", force: :cascade do |t|
    t.string "name"
    t.string "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studentassistants", force: :cascade do |t|
    t.string "sa_id"
    t.string "student_number"
    t.string "name"
    t.string "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "violations", force: :cascade do |t|
    t.string "student_number"
    t.string "admin_name"
    t.integer "major", default: 0
    t.integer "minor", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
