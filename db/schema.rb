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

ActiveRecord::Schema.define(version: 2021_02_28_132521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "criteria_definitions", force: :cascade do |t|
    t.string "references", array: true
    t.string "categories", array: true
    t.decimal "max_price", precision: 8, scale: 2
    t.string "destination", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["references", "categories", "max_price"], name: "index_cd_on_references_and_categories_and_max_price", unique: true
  end

  create_table "products", primary_key: "reference", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.string "category", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
