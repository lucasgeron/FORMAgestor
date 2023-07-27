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

ActiveRecord::Schema[7.0].define(version: 2023_07_26_230816) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_app_admins_on_client_id"
    t.index ["email"], name: "index_app_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_app_admins_on_reset_password_token", unique: true
  end

  create_table "app_cities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_app_cities_on_client_id"
  end

  create_table "app_clients", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.integer "licenses"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_subscribers", force: :cascade do |t|
    t.string "email"
    t.string "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_updates", force: :cascade do |t|
    t.string "version"
    t.date "release_date"
    t.text "description"
    t.text "added_features"
    t.text "removed_features"
    t.text "bugs_fixed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id", null: false
    t.index ["client_id"], name: "index_app_users_on_client_id"
    t.index ["email"], name: "index_app_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_app_users_on_reset_password_token", unique: true
  end

  add_foreign_key "app_admins", "app_clients", column: "client_id"
  add_foreign_key "app_cities", "app_clients", column: "client_id"
  add_foreign_key "app_users", "app_clients", column: "client_id"
end
