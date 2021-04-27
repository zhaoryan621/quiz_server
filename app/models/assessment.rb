# frozen_string_literal: true

class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  belongs_to :by_teacher, class_name: 'User', optional: true
  has_many :assessment_sessions, dependent: :destroy

  def total_score
    assessment_sessions.pluck(:score).sum
  end
end
