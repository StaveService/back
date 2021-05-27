FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.email }
    familyname { Faker::Name.first_name }
    givenname { Faker::Name.last_name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
