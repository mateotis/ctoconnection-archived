FactoryBot.define do
  factory :presentation do
    association :activity
    association :session
    association :event
    association :company
    association :presented_by, factory: :user
    sequence :title do |n|
      "Test Presentation #{n}"
    end
  end
end
