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

ActiveRecord::Schema[7.0].define(version: 2023_12_21_204947) do
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

  create_table "gnt_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "candidate"
    t.string "nationality"
    t.string "i_am"
    t.string "years_of_experience"
    t.string "apply_visa_for"
    t.text "current_resident"
    t.string "full_name"
    t.string "legal_name"
    t.boolean "terms_of_use"
    t.string "where_hear"
    t.string "year_of_graduation"
    t.boolean "currently_working"
    t.string "languages_spoken"
    t.boolean "auth_whatsapp"
    t.boolean "auth_text"
    t.string "license_type"
    t.boolean "stage3_1"
    t.integer "clinical_hour"
    t.text "other_1"
    t.text "other_2"
    t.text "other_3"
    t.string "english_proficiency"
    t.date "english_exam_pass_date"
    t.boolean "background_check"
    t.boolean "convicted_crime"
    t.boolean "disorder"
    t.boolean "rn_lisence"
    t.boolean "cgfns"
    t.string "nclex_rn"
    t.string "nclex_rn_state"
    t.boolean "rn_in_us"
    t.string "rn_in_us_state"
    t.string "country_code"
    t.string "phone_number"
    t.boolean "request_to_apply", default: false
    t.boolean "grant_apply_request", default: false
    t.integer "medical_surgical"
    t.integer "pediatrics"
    t.integer "obstetrics_gynecology"
    t.integer "psychiatry"
    t.integer "emergency"
    t.integer "critical_care_icu"
    t.integer "geriatrics_nursing_home"
    t.string "other_specialty_name"
    t.integer "other_specialty_hour"
    t.boolean "request_english_assessment", default: false
    t.string "current_resident_state"
    t.string "top_specialties"
    t.integer "license_number"
    t.date "expiration_date"
    t.boolean "additional_active_compact_license", default: false
    t.string "visascreen_status"
    t.string "interview_status"
    t.date "interview_date"
    t.boolean "stage_1", default: false
    t.boolean "stage_2", default: false
    t.boolean "stage_3", default: false
    t.boolean "stage_4", default: false
    t.boolean "stage_5", default: false
    t.boolean "stage_6", default: false
    t.boolean "stage_7", default: false
    t.boolean "stage_8", default: false
    t.boolean "stage_9", default: false
    t.boolean "stage_10", default: false
    t.boolean "check_list_1", default: false
    t.boolean "check_list_2", default: false
    t.boolean "check_list_3", default: false
    t.boolean "check_list_4", default: false
    t.boolean "check_list_5", default: false
    t.boolean "check_list_6", default: false
    t.boolean "check_list_7", default: false
    t.boolean "check_list_8", default: false
    t.boolean "check_list_9", default: false
    t.boolean "check_list_10", default: false
    t.boolean "check_list_11", default: false
    t.boolean "check_list_12", default: false
    t.boolean "check_list_13", default: false
    t.boolean "registration_status", default: false
    t.date "fingerprint_date"
    t.string "fingerprint_status"
    t.index ["email"], name: "index_gnt_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_gnt_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
