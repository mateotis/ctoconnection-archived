FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "test#{n}"
    end
    last_name { 'person' }
    sequence :linkedin_username do |n|
      "testperson#{n}"
    end
    sequence :email do |n|
      "testperson#{n}@gmail.com"
    end
  end
end
