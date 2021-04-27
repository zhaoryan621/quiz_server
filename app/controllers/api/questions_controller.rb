# frozen_string_literal: true

module Api
  class QuestionsController < ApplicationController
    def create
      authorize_action
      question = Question.create!(question_params)

      render :show, locals: { question: question }
    end

    private

    def question_params
      params.require(:question).permit(
        :quiz_id,
        :question,
        :correct_answer,
        :weight
      )
    end

    def policy_class
      Api::QuestionPolicy
    end

    def authorize_action(record = Question)
      authorize(record, "#{action_name}?", policy_class: policy_class)
    end
  end
end
