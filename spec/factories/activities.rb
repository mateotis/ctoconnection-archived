FactoryBot.define do
  factory :activity do
    association :session
    sequence :title do |n|
      "Test Activity #{n}"
    end
    activity_type { 'presentation' }
    starts { '2020-10-01 17:00:00' }
    ends { '2020-10-01 18:00:00' }
  end
end
