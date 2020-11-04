require 'rails_helper'

RSpec.describe User, type: :model do
  let(:activity) { FactoryBot.create(:activity) }

  it 'has a valid factory' do
    expect(activity).to be_valid
  end

  context 'validations' do
    context 'title' do
      it { expect(activity).to validate_presence_of(:title) }
    end

    context 'activity_type' do
      it { expect(activity).to validate_presence_of(:activity_type) }
    end
  end

  context 'associations' do
    it { expect(activity).to belong_to(:session) }
  end
end
