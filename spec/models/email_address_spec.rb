require 'rails_helper'

RSpec.describe User, type: :model do
  let(:email_address) { FactoryBot.create(:email_address) }

  it 'has a valid factory' do
    expect(email_address).to be_valid
  end

  context 'validations' do
    context 'email' do
      it { expect(email_address).to validate_presence_of(:email_address) }
      it { expect(email_address).to validate_uniqueness_of(:email_address).ignoring_case_sensitivity }
    end
  end

  context 'associations' do
    it { expect(email_address).to belong_to(:user) }
  end
end
