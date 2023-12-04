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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_125655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "available_models", force: :cascade do |t|
    t.string "model"
    t.string "image"
  end

  create_table "available_pilots", force: :cascade do |t|
    t.string "name"
    t.string "image"
  end

  create_table "baggages", force: :cascade do |t|
    t.float "weight"
    t.integer "count"
    t.bigint "plane_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plane_id"], name: "index_baggages_on_plane_id"
  end

  create_table "parts", force: :cascade do |t|
    t.bigint "plane_id"
    t.bigint "airport_id"
    t.index ["airport_id"], name: "index_parts_on_airport_id"
    t.index ["plane_id"], name: "index_parts_on_plane_id"
  end

  create_table "pilots", force: :cascade do |t|
    t.string "name"
    t.string "image", default: "x"
    t.bigint "plane_id"
    t.index ["plane_id"], name: "index_pilots_on_plane_id"
  end

  create_table "planes", force: :cascade do |t|
    t.string "model"
    t.string "image", default: "x"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
