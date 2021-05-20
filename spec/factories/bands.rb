FactoryBot.define do
  factory :band do
    name { Faker::Music.band }
    trait :without_name do
      name { nil }
    end
  end
end
