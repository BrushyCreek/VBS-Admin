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

ActiveRecord::Schema.define(version: 20170503205649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kids", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "last_grade_id"
    t.string "gender"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.string "parent_name"
    t.string "parent_email"
    t.string "parent_phone"
    t.boolean "church_member"
    t.string "invited_by"
    t.integer "tshirt_size_id"
    t.boolean "allergies"
    t.text "allergies_notes"
    t.boolean "medical_issues"
    t.text "medical_issues_notes"
    t.string "buddy_request"
    t.text "notes"
    t.string "pickupper_1_name"
    t.string "pickupper_1_phone"
    t.string "pickupper_2_name"
    t.string "pickupper_2_phone"
    t.string "pickupper_3_name"
    t.string "pickupper_3_phone"
    t.boolean "highlight", default: false
    t.boolean "can_photograph"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_kids_on_group_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "leader_type"
    t.bigint "leader_id"
    t.index ["leader_type", "leader_id"], name: "index_volunteers_on_leader_type_and_leader_id"
  end

end
