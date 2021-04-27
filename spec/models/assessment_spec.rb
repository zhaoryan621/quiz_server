# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Assessment, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:score).of_type(:float) }
    it { is_expected.to have_db_column(:by_teacher_id).of_type(:integer) }
  end

  describe 'Model relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:quiz) }
    it { is_expected.to have_many(:assessment_sessions) }
  end

  describe 'Table indexes' do
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:quiz_id) }
    it { is_expected.to have_db_index(:by_teacher_id) }
  end

  describe '#calculate_score' do
    before do
      create(:assessment_session, assessment: assessment, score: 48)
      create(:assessment_session, assessment: assessment, score: 36)
    end

    let(:assessment) { create(:assessment) }

    it { expect(assessment.total_score).to eq(84) }
  end
end
