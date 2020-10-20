require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  context 'validations' do
    it 'is invalid without a unique linkedin username' do
      new_user = FactoryBot.build(:user, linkedin_username: user.linkedin_username)
      expect(new_user).to_not be_valid
      expect(new_user.errors.full_messages).to eq(['Linkedin username has already been taken'])
    end
  end
end
