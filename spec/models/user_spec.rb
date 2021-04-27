# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
  end

  describe 'Model validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '#full_name' do
    let(:user) { create(:user) }

    it { expect(user.full_name).to include(user.first_name.titleize) }
    it { expect(user.full_name).to include(user.last_name.titleize) }
  end
end
