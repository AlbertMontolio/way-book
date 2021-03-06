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

ActiveRecord::Schema.define(version: 20180120135350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "division_id"
    t.index ["division_id"], name: "index_categories_on_division_id", using: :btree
  end

  create_table "company_skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_company_skills_on_category_id", using: :btree
  end

  create_table "curriculums", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "profile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "document"
    t.index ["profile_id"], name: "index_curriculums_on_profile_id", using: :btree
  end

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "own_company_skills", force: :cascade do |t|
    t.string   "name"
    t.boolean  "check",       default: true
    t.integer  "profile_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "category_id"
    t.integer  "rating"
    t.index ["profile_id"], name: "index_own_company_skills_on_profile_id", using: :btree
  end

  create_table "own_skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_own_skills_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "team"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "position"
    t.string   "nationality"
    t.date     "birthday"
    t.date     "startway"
    t.date     "endway"
    t.integer  "division_id"
    t.index ["division_id"], name: "index_profiles_on_division_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "client"
    t.date     "start"
    t.date     "finish"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_projects_on_profile_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "authentication_token",   limit: 30
    t.boolean  "admin",                             default: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "categories", "divisions"
  add_foreign_key "company_skills", "categories"
  add_foreign_key "curriculums", "users", column: "profile_id"
  add_foreign_key "own_company_skills", "categories"
  add_foreign_key "own_company_skills", "profiles"
  add_foreign_key "own_skills", "profiles"
  add_foreign_key "profiles", "divisions"
  add_foreign_key "profiles", "users"
  add_foreign_key "projects", "profiles"
end
