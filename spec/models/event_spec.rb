require 'rails_helper'

RSpec.describe User, type: :model do
  let(:event) { FactoryBot.create(:event) }

  it 'has a valid factory' do
    expect(event).to be_valid
  end

  context 'validations' do
    context 'title' do
      it { expect(event).to validate_presence_of(:title) }
    end
  end

  context 'associations' do
    it { expect(event).to have_many(:sessions) }
  end
end
