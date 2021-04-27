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

ActiveRecord::Schema.define(version: 2021_04_25_211701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_sessions", force: :cascade do |t|
    t.bigint "assessment_id"
    t.bigint "question_id"
    t.string "answer"
    t.integer "score", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assessment_id"], name: "index_assessment_sessions_on_assessment_id"
    t.index ["question_id"], name: "index_assessment_sessions_on_question_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.float "score", default: 0.0
    t.bigint "by_teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["by_teacher_id"], name: "index_assessments_on_by_teacher_id"
    t.index ["quiz_id"], name: "index_assessments_on_quiz_id"
    t.index ["user_id"], name: "index_assessments_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "quiz_id"
    t.string "question", null: false
    t.string "correct_answer"
    t.float "weight", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_quizzes_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assessment_sessions", "assessments", on_delete: :cascade
  add_foreign_key "assessment_sessions", "questions", on_delete: :cascade
  add_foreign_key "assessments", "quizzes", on_delete: :cascade
  add_foreign_key "assessments", "users", column: "by_teacher_id", on_delete: :nullify
  add_foreign_key "assessments", "users", on_delete: :cascade
  add_foreign_key "questions", "quizzes", on_delete: :cascade
  add_foreign_key "quizzes", "users", column: "creator_id", on_delete: :nullify
end
