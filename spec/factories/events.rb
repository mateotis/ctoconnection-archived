FactoryBot.define do
  factory :event do
    sequence :title do |n|
      "Test Event #{n}"
    end
  end
end
