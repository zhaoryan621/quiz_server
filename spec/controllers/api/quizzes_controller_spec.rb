# frozen_string_literal: true

require 'rails_helper'

module Api
  RSpec.describe QuizzesController, type: :controller do # rubocop:disable Metrics/BlockLength
    before { sign_in(current_user) }

    let(:current_user) { create(:user) }
    let(:quiz) { create(:quiz) }
    let(:quiz_params) do
      { quiz: {
        title: Faker::Lorem.sentence(word_count: 5)
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
          get :show, params: { id: quiz.id }, format: :json
        end

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:show) }
      end

      context 'with invalid' do
        before do
          current_user.update!(user_role: false)
          get :show, params: { id: quiz.id }, format: :json
        end

        it { is_expected.to respond_with(:forbidden) }
      end
    end

    describe 'POST create' do
      context 'with valid' do
        before do
          current_user.update!(supervisor_role: true)
          post :create, params: quiz_params, format: :json
        end

        it { is_expected.to respond_with(:ok) }
        it { is_expected.to render_template(:show) }
      end

      context 'with invalid' do
        before do
          current_user.update!(supervisor_role: false)
          post :create, params: quiz_params, format: :json
        end

        it { is_expected.to respond_with(:forbidden) }
      end
    end
  end
end
