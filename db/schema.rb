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

ActiveRecord::Schema[7.0].define(version: 2023_01_22_062624) do
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

  create_table "events", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.datetime "date"
    t.string "period"
    t.datetime "deleted_at"
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["deleted_at"], name: "index_events_on_deleted_at"
    t.index ["group_id"], name: "index_events_on_group_id"
    t.index ["slug"], name: "index_events_on_slug", unique: true
    t.index ["store_id"], name: "index_events_on_store_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "slug"
    t.index ["deleted_at"], name: "index_groups_on_deleted_at"
    t.index ["slug"], name: "index_groups_on_slug", unique: true
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.string "invite_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_invites_on_group_id"
    t.index ["invite_token"], name: "index_invites_on_invite_token", unique: true
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "description"
    t.bigint "store_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["deleted_at"], name: "index_meals_on_deleted_at"
    t.index ["store_id"], name: "index_meals_on_store_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "branch"
    t.string "county"
    t.string "district"
    t.string "street_address"
    t.string "tel"
    t.string "opening"
    t.text "note"
    t.boolean "online", default: true
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "slug"
    t.index ["branch"], name: "index_stores_on_branch"
    t.index ["county"], name: "index_stores_on_county"
    t.index ["deleted_at"], name: "index_stores_on_deleted_at"
    t.index ["name"], name: "index_stores_on_name"
    t.index ["online"], name: "index_stores_on_online"
    t.index ["slug"], name: "index_stores_on_slug", unique: true
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "tray_items", force: :cascade do |t|
    t.bigint "tray_id", null: false
    t.bigint "meal_id", null: false
    t.integer "quantity"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_tray_items_on_meal_id"
    t.index ["tray_id"], name: "index_tray_items_on_tray_id"
  end

  create_table "trays", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_trays_on_event_id"
    t.index ["user_id"], name: "index_trays_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "groups"
  add_foreign_key "events", "stores"
  add_foreign_key "events", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "invites", "groups"
  add_foreign_key "meals", "stores"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
  add_foreign_key "stores", "users"
  add_foreign_key "tray_items", "meals"
  add_foreign_key "tray_items", "trays"
  add_foreign_key "trays", "events"
  add_foreign_key "trays", "users"
end
