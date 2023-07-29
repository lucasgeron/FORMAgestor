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

ActiveRecord::Schema[7.0].define(version: 2023_07_29_162352) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "app_cities_vendors", id: false, force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "vendor_id"
    t.index ["city_id"], name: "index_app_cities_vendors_on_city_id"
    t.index ["vendor_id"], name: "index_app_cities_vendors_on_vendor_id"
  end

  create_table "app_clients", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.integer "licenses"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "app_prospects", force: :cascade do |t|
    t.bigint "vendor_id"
    t.string "channel"
    t.string "institution"
    t.string "city"
    t.string "course"
    t.string "ammount"
    t.string "year_graduation"
    t.string "name"
    t.string "phone"
    t.string "instagram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_app_prospects_on_client_id"
    t.index ["vendor_id"], name: "index_app_prospects_on_vendor_id"
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
    t.bigint "vendor_id"
    t.index ["client_id"], name: "index_app_users_on_client_id"
    t.index ["email"], name: "index_app_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_app_users_on_reset_password_token", unique: true
    t.index ["vendor_id"], name: "index_app_users_on_vendor_id"
  end

  create_table "app_vendors", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "role"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_app_vendors_on_client_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "app_admins", "app_clients", column: "client_id"
  add_foreign_key "app_cities", "app_clients", column: "client_id"
  add_foreign_key "app_cities_vendors", "app_cities", column: "city_id"
  add_foreign_key "app_cities_vendors", "app_vendors", column: "vendor_id"
  add_foreign_key "app_prospects", "app_clients", column: "client_id"
  add_foreign_key "app_prospects", "app_vendors", column: "vendor_id"
  add_foreign_key "app_users", "app_clients", column: "client_id"
  add_foreign_key "app_users", "app_vendors", column: "vendor_id"
  add_foreign_key "app_vendors", "app_clients", column: "client_id"
end
