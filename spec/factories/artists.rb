FactoryBot.define do
  factory :artist do
    name { Faker::Name.name }
    trait :without_name do
      name { nil }
    end
  end
end