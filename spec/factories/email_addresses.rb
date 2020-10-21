FactoryBot.define do
  factory :email_address do
    sequence :email_address do |n|
      "test#{n}@gmail.com"
    end
    home { false }
    primary { true }
    association :user
  end
end
