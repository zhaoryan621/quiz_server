# frozen_string_literal: true

class AssessmentSession < ApplicationRecord
  belongs_to :assessment
  belongs_to :question

  def calculate_score(score)
    score.to_i * question.weight
  end
end
