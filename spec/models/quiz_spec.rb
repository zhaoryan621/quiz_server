# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
  end

  describe 'Model relations' do
    it { is_expected.to belong_to(:creator) }
    it { is_expected.to have_many(:questions) }
  end
end
