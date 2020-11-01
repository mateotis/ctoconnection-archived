FactoryBot.define do
  factory :presentation do
    activity { nil }
    session { nil }
    event { nil }
    title { 'MyString' }
    presenter_firstname { 'MyString' }
    presenter_lastname { 'MyString' }
    presenter_linkedin_username { 'MyString' }
    presenter_email { 'MyString' }
    presenter_title { 'MyString' }
    presenter_company { 'MyString' }
    company { nil }
    user { nil }
  end
end
