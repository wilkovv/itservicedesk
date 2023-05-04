# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_04_004028) do
  create_table "issues", force: :cascade do |t|
    t.integer "serviceman_id", null: false
    t.integer "user_id", null: false
    t.string "description"
    t.string "photo"
    t.string "category"
    t.string "service_comment"
    t.string "status_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serviceman_id"], name: "index_issues_on_serviceman_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "servicemen", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "issues", "servicemen"
  add_foreign_key "issues", "users"
end
