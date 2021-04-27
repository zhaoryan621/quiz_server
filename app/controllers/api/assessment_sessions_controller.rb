# frozen_string_literal: true

module Api
  class AssessmentSessionsController < ApplicationController
    def create
      authorize_action
      assessment_session = AssessmentSession.create!(assessment_session_params)

      render :show, locals: { assessment_session: assessment_session }
    end

    def mark_as_score
      authorize_action(assessment_session)
      assessment_session.update!(score: assessment_session.calculate_score(params[:score]))

      render :show, locals: { assessment_session: assessment_session }
    end

    private

    def assessment_session
      @assessment_session ||= AssessmentSession.find(params[:id])
    end

    def assessment_session_params
      params.require(:assessment_session).permit(
        :assessment_id,
        :question_id,
        :answer
      )
    end

    def policy_class
      Api::AssessmentSessionPolicy
    end

    def authorize_action(record = AssessmentSession)
      authorize(record, "#{action_name}?", policy_class: policy_class)
    end
  end
end
