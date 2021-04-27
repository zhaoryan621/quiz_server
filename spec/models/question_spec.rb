# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:question).of_type(:string) }
    it { is_expected.to have_db_column(:correct_answer).of_type(:string) }
    it { is_expected.to have_db_column(:weight).of_type(:float) }
  end

  describe 'Model relations' do
    it { is_expected.to belong_to(:quiz) }
  end
end
