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

ActiveRecord::Schema.define(version: 2020_07_15_105234) do

  create_table "categories", force: :cascade do |t|
    t.string "subject"
    t.string "subject_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "student_id"
    t.integer "video_id"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_comments_on_student_id"
    t.index ["video_id"], name: "index_comments_on_video_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "student_id"
    t.integer "video_id"
    t.integer "high_low"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id", "video_id"], name: "index_evaluations_on_student_id_and_video_id", unique: true
    t.index ["student_id"], name: "index_evaluations_on_student_id"
    t.index ["video_id"], name: "index_evaluations_on_video_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "student_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_follows_on_follow_id"
    t.index ["student_id", "follow_id"], name: "index_follows_on_student_id_and_follow_id", unique: true
    t.index ["student_id"], name: "index_follows_on_student_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "student_id"
    t.integer "category_id"
    t.integer "academic_stage", null: false
    t.string "title", null: false
    t.text "detail"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_requests_on_category_id"
    t.index ["student_id"], name: "index_requests_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", null: false
    t.integer "grade", null: false
    t.text "introduction"
    t.string "image"
    t.integer "ticket_count", default: 0
    t.string "primary_school"
    t.string "middle_school"
    t.string "high_school"
    t.boolean "is_subscribe", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.integer "student_id"
    t.integer "request_id"
    t.integer "category_id"
    t.integer "academic_stage", null: false
    t.string "title", null: false
    t.string "content"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_videos_on_category_id"
    t.index ["request_id"], name: "index_videos_on_request_id"
    t.index ["student_id"], name: "index_videos_on_student_id"
    t.index ["title"], name: "index_videos_on_title"
  end

  create_table "watches", force: :cascade do |t|
    t.integer "student_id"
    t.integer "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id", "video_id"], name: "index_watches_on_student_id_and_video_id", unique: true
    t.index ["student_id"], name: "index_watches_on_student_id"
    t.index ["video_id"], name: "index_watches_on_video_id"
  end

end
