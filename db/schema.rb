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

ActiveRecord::Schema.define(version: 2020_03_31_002333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_ins", force: :cascade do |t|
    t.bigint "prescription_schedule_id", null: false
    t.date "completed_timestamp"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "scheduled_date"
    t.index ["prescription_schedule_id"], name: "index_check_ins_on_prescription_schedule_id"
  end

  create_table "prescription_schedules", force: :cascade do |t|
    t.bigint "prescription_id", null: false
    t.string "day_of_week"
    t.string "time_of_day"
    t.boolean "as_needed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prescription_id"], name: "index_prescription_schedules_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.decimal "amount"
    t.string "instructions"
    t.date "start_date"
    t.date "end_date"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_prescriptions_on_product_id"
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "medium_type"
    t.decimal "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "company"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "check_ins", "prescription_schedules"
  add_foreign_key "prescription_schedules", "prescriptions"
  add_foreign_key "prescriptions", "products"
  add_foreign_key "prescriptions", "users"
end
