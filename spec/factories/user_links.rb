FactoryBot.define do
  factory :user_link do
    references { '' }
    twitter { 'MyString' }
  end
end
