require 'rails_helper'

RSpec.describe User, type: :model do
  let(:presentation) { FactoryBot.create(:presentation) }

  it 'has a valid factory' do
    expect(presentation).to be_valid
  end

  context 'validations' do
    context 'title' do
      it { expect(presentation).to validate_presence_of(:title) }
    end
  end

  context 'associations' do
    it { expect(presentation).to belong_to(:company) }
    it { expect(presentation).to belong_to(:event) }
    it { expect(presentation).to belong_to(:session) }
    it { expect(presentation).to belong_to(:activity) }
    it { expect(presentation).to belong_to(:presented_by) }
  end
end
