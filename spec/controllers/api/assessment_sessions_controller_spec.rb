# frozen_string_literal: true

require 'rails_helper'

module Api
  RSpec.describe AssessmentSessionsController, type: :controller do # rubocop:disable Metrics/BlockLength
    before do
      sign_in(current_user)
    end

    let(:current_user) { create(:user) }
    let(:assessment) { create(:assessment) }
    let(:assessment_session) { create(:assessment_session) }
    let(:question) { create(:question) }
    let(:assessment_session_params) do
      { assessment_session: {
        assessment_id: assessment.id,
        question_id: question.id,
        answer: Faker::Lorem.sentence(word_count: 5)
      } }
    end

    describe 'POST create' do
      context 'with valid' do
        before do
          post :create, params: assessment_session_params, format: :json
        end

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:show) }
      end

      context 'with invalid' do
        before do
          current_user.update!(user_role: false)
          post :create, params: assessment_session_params, format: :json
        end

        it { is_expected.to respond_with(:forbidden) }
      end
    end

    describe 'PUT mark_as_score' do
      context 'with valid' do
        before do
          current_user.update!(supervisor_role: true)
          put :mark_as_score, params: { id: assessment_session.id, score: Faker::Number.number }, format: :json
        end

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:show) }
      end

      context 'with invalid' do
        before do
          current_user.update!(supervisor_role: false)
          put :mark_as_score, params: { id: assessment_session.id, score: Faker::Number.number }, format: :json
        end

        it { is_expected.to respond_with(:forbidden) }
      end
    end
  end
end
