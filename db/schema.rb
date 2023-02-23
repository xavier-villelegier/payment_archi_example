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

ActiveRecord::Schema[7.0].define(version: 2023_02_23_152608) do
  create_table "adyen_payment_events", force: :cascade do |t|
    t.json "metadata"
    t.text "psp_reference"
    t.integer "payment_event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_event_id"],
            name: "index_adyen_payment_events_on_payment_event_id"
  end

  create_table "payment_events", force: :cascade do |t|
    t.text "provider"
    t.text "event_type"
    t.integer "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_payment_events_on_payment_id"
  end

  create_table "stripe_payment_events", force: :cascade do |t|
    t.json "metadata"
    t.text "psp_reference"
    t.integer "payment_event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_event_id"],
            name: "index_stripe_payment_events_on_payment_event_id"
  end

  create_table "payments", force: :cascade do |t|
    t.float "amount"
    t.datetime "captured_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "adyen_payment_events", "payment_events"
  add_foreign_key "payment_events", "payments"
  add_foreign_key "stripe_payment_events", "payment_events"
end
