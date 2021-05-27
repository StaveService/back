FactoryBot.define do
  factory :album do
    title { Faker::Name.name }
    trait :without_title do
      title { nil }
    end
  end
end
