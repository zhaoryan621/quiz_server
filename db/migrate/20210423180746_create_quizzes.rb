# frozen_string_literal: true

class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.belongs_to :creator, index: true
      t.string :title, null: false
      t.timestamps
    end
    add_foreign_key :quizzes, :users, column: :creator_id, on_delete: :nullify
  end
end
