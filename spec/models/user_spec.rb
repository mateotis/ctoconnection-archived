require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  context 'validations' do
    context 'linkedin_username' do
      it { expect(user).to validate_uniqueness_of(:linkedin_username).ignoring_case_sensitivity }
    end

    context 'email' do
      it { expect(user).to validate_presence_of(:email) }
      it { expect(user).to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    end
  end

  context 'associations' do
    it { expect(user).to have_many(:email_addresses) }
  end
end
