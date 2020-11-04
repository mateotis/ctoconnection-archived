require 'rails_helper'

RSpec.describe User, type: :model do
  let(:session) { FactoryBot.create(:session) }

  it 'has a valid factory' do
    expect(session).to be_valid
  end

  context 'validations' do
    context 'title' do
      it { expect(session).to validate_presence_of(:title) }
    end

    context 'starts' do
      it { expect(session).to validate_presence_of(:starts) }
    end

    context 'ends' do
      it { expect(session).to validate_presence_of(:ends) }
    end

    context 'duration' do
      it { expect(session).to allow_value(60).for(:duration) }
    end
  end

  context 'associations' do
    it { expect(session).to belong_to(:event) }
    it { expect(session).to have_many(:activities) }
  end
end
