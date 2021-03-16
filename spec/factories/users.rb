FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.email }
    familyname { Faker::Name.name }
    givenname { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
