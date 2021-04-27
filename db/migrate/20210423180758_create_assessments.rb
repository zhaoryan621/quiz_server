# frozen_string_literal: true

class CreateAssessments < ActiveRecord::Migration[6.1]
  def change
    create_table :assessments do |t|
      t.belongs_to :user
      t.belongs_to :quiz
      t.float :score, default: 0.0
      t.belongs_to :by_teacher
      t.timestamps
    end
    add_foreign_key :assessments, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :assessments, :quizzes, column: :quiz_id, on_delete: :cascade
    add_foreign_key :assessments, :users, column: :by_teacher_id, on_delete: :nullify
    add_index :assessments, [:user_id, :quiz_id, :by_teacher_id], unique: true
  end
end
