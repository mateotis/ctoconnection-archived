FactoryBot.define do
  factory :session do
    title { 'MyString' }
    starts { '2020-10-26 14:19:27' }
    ends { '2020-10-26 14:19:27' }
    duration { 1 }
    event { nil }
  end
end
