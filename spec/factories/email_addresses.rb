FactoryBot.define do
  factory :email_address do
    association :user
    sequence :email_address do |n|
      "testperson#{n}@gmail.com"
    end
    home { false }
    primary { true }
  end
end
