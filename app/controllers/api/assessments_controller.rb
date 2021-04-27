# frozen_string_literal: true

module Api
  class AssessmentsController < ApplicationController
    def index
      authorize_action

      render :index, locals: { assessments: Assessment.all }
    end

    def show
      authorize_action(assessment)

      render :show, locals: { assessment: assessment }
    end

    def create
      authorize_action
      assessment = Assessment.create!(assessment_params)

      render :show, locals: { assessment: assessment }
    end

    def complete
      authorize_action(assessment)
      assessment.update!(score: assessment.total_score, by_teacher: current_user)

      render :show, locals: { assessment: assessment }
    end

    private

    def assessment
      @assessment ||= Assessment.find(params[:id])
    end

    def assessment_params
      params.require(:assessment).permit(
        :user_id,
        :quiz_id,
        :score,
        :by_teacher_id
      )
    end

    def policy_class
      Api::AssessmentPolicy
    end

    def authorize_action(record = Assessment)
      authorize(record, "#{action_name}?", policy_class: policy_class)
    end
  end
end
