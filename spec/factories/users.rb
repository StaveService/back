FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.email }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
