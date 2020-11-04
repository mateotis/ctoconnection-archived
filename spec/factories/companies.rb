FactoryBot.define do
  factory :company do
    sequence :name do |n|
      "Test Company #{n}"
    end
  end
end
