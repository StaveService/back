FactoryBot.define do
  factory :issue do
    user { nil }
    music { nil }
    title { 'MyString' }
    description { 'MyString' }
  end
end
