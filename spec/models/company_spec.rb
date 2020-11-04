require 'rails_helper'

RSpec.describe User, type: :model do
  let(:company) { FactoryBot.create(:company) }

  it 'has a valid factory' do
    expect(company).to be_valid
  end

  context 'validations' do
    context 'name' do
      it { expect(company).to validate_presence_of(:name) }
      it { expect(company).to validate_uniqueness_of(:name).ignoring_case_sensitivity }
    end
  end
end
