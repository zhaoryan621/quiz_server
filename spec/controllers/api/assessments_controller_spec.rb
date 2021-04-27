# frozen_string_literal: true

require 'rails_helper'

module Api
  RSpec.describe AssessmentsController, type: :controller do # rubocop:disable Metrics/BlockLength
    before { sign_in(current_user) }

    let(:current_user) { create(:user) }
    let(:assessment) { create(:assessment) }
    let(:quiz) { create(:quiz) }
    let(:assessment_params) do
      { assessment: {
        user_id: current_user.id,
        quiz_id: quiz.id,
        score: Faker::Number.number
      } }
    end

    describe 'GET index' do
      context 'with valid' do
        before do
          get :index, format: :json
        end

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:index) }
      end

      context 'with invalid' do
        before do
          current_user.update!(user_role: false)
          get :index, format: :json
        end

        it { is_expected.to respond_with(:forbidden) }
      end
    end

    describe 'GET show' do
      context 'with valid' do
        before do
          get :show, params: { id: assessment.id }, format: :json
        end

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:show) }
      end

      context 'with invalid' do
        before do
          current_user.update!(user_role: false)
          get :show, params: { id: assessment.id }, format: :json
        end

        it { is_expected.to respond_with(:forbidden) }
      end
    end

    describe 'POST create' do
      context 'with valid' do
        before do
          post :create, params: assessment_params, format: :json
        end

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:show) }
      end

      context 'with invalid' do
        before do
          current_user.update!(user_role: false)
          post :create, params: assessment_params, format: :json
        end

        it { is_expected.to respond_with(:forbidden) }
      end
    end

    describe 'PUT complete' do
      context 'with valid' do
        before do
          put :complete, params: { id: assessment.id,
                                   score: Faker::Number.number,
                                   by_teacher_id: current_user.id }, format: :json
        end

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:show) }
      end

      context 'with invalid' do
        before do
          current_user.update!(user_role: false)
          put :complete, params: { id: assessment.id,
                                   score: Faker::Number.number,
                                   by_teacher_id: current_user.id }, format: :json
        end

        it { is_expected.to respond_with(:forbidden) }
      end
    end
  end
end
