# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssessmentSession, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:answer).of_type(:string) }
    it { is_expected.to have_db_column(:score).of_type(:integer) }
  end

  describe 'Model relations' do
    it { is_expected.to belong_to(:assessment) }
    it { is_expected.to belong_to(:question) }
  end

  describe '#calculate_score' do
    let(:question) { create(:question, weight: 0.6) }
    let(:assessment_session) { create(:assessment_session, question: question) }

    it { expect(assessment_session.calculate_score(80)).to eq(48) }
  end
end
