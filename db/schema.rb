# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_29_160731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer "activity_type"
    t.datetime "starts"
    t.datetime "ends"
    t.bigint "session_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["session_id"], name: "index_activities_on_session_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "linkedin_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string "email_address"
    t.boolean "primary"
    t.boolean "home"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_email_addresses_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "starts"
    t.datetime "ends"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "new_events", force: :cascade do |t|
    t.datetime "cfp_start_time"
    t.datetime "cfp_end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "presentations", force: :cascade do |t|
    t.string "title"
    t.string "presenter_firstname"
    t.string "presenter_lastname"
    t.string "presenter_linkedin_username"
    t.string "presenter_email"
    t.string "presenter_title"
    t.string "presenter_company"
    t.bigint "activity_id"
    t.bigint "session_id"
    t.bigint "event_id"
    t.bigint "company_id"
    t.bigint "presented_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_presentations_on_activity_id"
    t.index ["company_id"], name: "index_presentations_on_company_id"
    t.index ["event_id"], name: "index_presentations_on_event_id"
    t.index ["presented_by_id"], name: "index_presentations_on_presented_by_id"
    t.index ["session_id"], name: "index_presentations_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "title"
    t.datetime "starts"
    t.datetime "ends"
    t.integer "duration"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_sessions_on_event_id"
  end

  create_table "talks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "linkedin_username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "activities", "sessions"
  add_foreign_key "email_addresses", "users"
  add_foreign_key "presentations", "activities"
  add_foreign_key "presentations", "companies"
  add_foreign_key "presentations", "events"
  add_foreign_key "presentations", "sessions"
  add_foreign_key "presentations", "users", column: "presented_by_id"
  add_foreign_key "sessions", "events"
end
