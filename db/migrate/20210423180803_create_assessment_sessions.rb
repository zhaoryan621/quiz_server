# frozen_string_literal: true

class CreateAssessmentSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :assessment_sessions do |t|
      t.belongs_to :assessment
      t.belongs_to :question
      t.string :answer
      t.integer :score, default: 0
      t.timestamps
    end
    add_foreign_key :assessment_sessions, :assessments, on_delete: :cascade
    add_foreign_key :assessment_sessions, :questions, on_delete: :cascade
    add_index :assessment_sessions, [:assessment_id, :question_id], unique: true
  end
end
