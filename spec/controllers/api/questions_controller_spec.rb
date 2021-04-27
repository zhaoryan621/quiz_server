# frozen_string_literal: true

require 'rails_helper'

module Api
  RSpec.describe QuestionsController, type: :controller do # rubocop:disable Metrics/BlockLength
    before { sign_in(current_user) }

    let(:current_user) { create(:user) }
    let(:quiz) { create(:quiz) }
    let(:question_params) do
      { question: {
        quiz_id: quiz.id,
        question: Faker::Lorem.sentence(word_count: 5),
        correct_answer: Faker::Lorem.sentence(word_count: 5),
        weight: Faker::Number.number
      } }
    end

    describe 'POST create' do
      context 'with valid' do
        before do
          current_user.update!(supervisor_role: true)
          post :create, params: question_params, format: :json
        end

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:show) }
      end

      context 'with invalid' do
        before do
          current_user.update!(supervisor_role: false)
          post :create, params: question_params, format: :json
        end

        it { is_expected.to respond_with(:forbidden) }
      end
    end
  end
end
