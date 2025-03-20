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

ActiveRecord::Schema[8.0].define(version: 2025_03_20_000717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "additional_services", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extra_services", force: :cascade do |t|
    t.bigint "signature_id", null: false
    t.bigint "additional_service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_service_id"], name: "index_extra_services_on_additional_service_id"
    t.index ["signature_id"], name: "index_extra_services_on_signature_id"
  end

  create_table "pack_services", force: :cascade do |t|
    t.bigint "additional_service_id", null: false
    t.bigint "pack_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_service_id"], name: "index_pack_services_on_additional_service_id"
    t.index ["pack_id"], name: "index_pack_services_on_pack_id"
  end

  create_table "packs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signatures", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pack_id"
    t.bigint "subscription_plan_id", null: false
    t.decimal "totalValue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pack_id"], name: "index_signatures_on_pack_id"
    t.index ["subscription_plan_id"], name: "index_signatures_on_subscription_plan_id"
    t.index ["user_id"], name: "index_signatures_on_user_id"
  end

  create_table "subscription_plans", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
  end

  add_foreign_key "extra_services", "additional_services"
  add_foreign_key "extra_services", "signatures"
  add_foreign_key "pack_services", "additional_services"
  add_foreign_key "pack_services", "packs"
  add_foreign_key "signatures", "packs"
  add_foreign_key "signatures", "subscription_plans"
  add_foreign_key "signatures", "users"
end
