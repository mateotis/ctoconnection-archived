FactoryBot.define do
  factory :session do
    association :event
    sequence :title do |n|
      "Test Session #{n}"
    end
    starts { '2020-10-01 17:00:00' }
    ends { '2020-10-01 18:00:00' }
    duration { 60 }
  end
end
