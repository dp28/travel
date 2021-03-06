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

ActiveRecord::Schema.define(version: 2018_05_06_105456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_accommodations_on_day_id"
    t.index ["location_id"], name: "index_accommodations_on_location_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_areas_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "currency_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "day_locations", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id", "location_id"], name: "index_day_locations_on_day_id_and_location_id", unique: true
    t.index ["day_id"], name: "index_day_locations_on_day_id"
    t.index ["location_id"], name: "index_day_locations_on_location_id"
  end

  create_table "days", force: :cascade do |t|
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", null: false
    t.index ["number"], name: "index_days_on_number", unique: true
  end

  create_table "expenses", force: :cascade do |t|
    t.float "amount", null: false
    t.string "currency_code", null: false
    t.string "category", null: false
    t.bigint "day_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_expenses_on_day_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_foods_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id", null: false
    t.string "type", null: false
    t.index ["area_id"], name: "index_locations_on_area_id"
  end

  create_table "meal_foods", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_meal_foods_on_food_id"
    t.index ["meal_id"], name: "index_meal_foods_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.integer "ordering", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id", "ordering"], name: "index_meals_on_day_id_and_ordering", unique: true
    t.index ["day_id"], name: "index_meals_on_day_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url", null: false
    t.string "caption"
    t.bigint "day_id", null: false
    t.boolean "favourite", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "width", null: false
    t.integer "height", null: false
    t.index ["day_id"], name: "index_photos_on_day_id"
    t.index ["url", "day_id"], name: "index_photos_on_url_and_day_id", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "written_at", null: false
    t.integer "day_id", null: false
    t.index ["day_id"], name: "index_posts_on_day_id"
  end

end
