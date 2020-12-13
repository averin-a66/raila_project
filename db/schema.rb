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

ActiveRecord::Schema.define(version: 2020_12_13_090745) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "body"
    t.integer "recipe_id", null: false
    t.datetime "com_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_comments_on_recipe_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country"
    t.integer "system_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["system_id"], name: "index_countries_on_system_id"
  end

  create_table "enum_converts", force: :cascade do |t|
    t.integer "enum_from_id", null: false
    t.integer "enum_to_id", null: false
    t.decimal "ratio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enum_from_id"], name: "index_enum_converts_on_enum_from_id"
    t.index ["enum_to_id"], name: "index_enum_converts_on_enum_to_id"
  end

  create_table "enums", force: :cascade do |t|
    t.string "name"
    t.string "short"
    t.string "kind"
    t.integer "system_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["system_id"], name: "index_enums_on_system_id"
  end

  create_table "ingrs", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.string "name_in"
    t.decimal "amount_in"
    t.integer "enum_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enum_id"], name: "index_ingrs_on_enum_id"
    t.index ["recipe_id"], name: "index_ingrs_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "systems", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_countries", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_user_countries_on_country_id"
    t.index ["user_id"], name: "index_user_countries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "", null: false
    t.integer "country_id"
    t.string "workgroup"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "recipes"
  add_foreign_key "comments", "users"
  add_foreign_key "countries", "systems"
  add_foreign_key "enum_converts", "enums", column: "enum_from_id"
  add_foreign_key "enum_converts", "enums", column: "enum_to_id"
  add_foreign_key "enums", "systems"
  add_foreign_key "ingrs", "enums"
  add_foreign_key "ingrs", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "user_countries", "countries"
  add_foreign_key "user_countries", "users"
  add_foreign_key "users", "countries"
end
