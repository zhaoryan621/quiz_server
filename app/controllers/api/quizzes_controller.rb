# frozen_string_literal: true

module Api
  class QuizzesController < ApplicationController
    def index
      authorize_action

      render :index, locals: { quizzes: Quiz.all }
    end

    def show
      authorize_action(quiz)

      render :show, locals: { quiz: quiz }
    end

    def create
      authorize_action
      quiz = Quiz.create!(quiz_params)

      render :show, locals: { quiz: quiz }
    end

    private

    def quiz
      @quiz ||= Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(
        :title,
        :creator_id
      )
    end

    def policy_class
      Api::QuizPolicy
    end

    def authorize_action(record = Quiz)
      authorize(record, "#{action_name}?", policy_class: policy_class)
    end
  end
end
