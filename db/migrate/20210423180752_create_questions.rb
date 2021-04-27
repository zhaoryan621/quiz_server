# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.belongs_to :quiz, index: true
      t.string :question, null: false
      t.string :correct_answer
      t.float :weight, default: 0.0
      t.timestamps
    end
    add_foreign_key :questions, :quizzes, column: :quiz_id, on_delete: :cascade
  end
end
