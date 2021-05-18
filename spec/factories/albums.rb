FactoryBot.define do
  factory :album do
    title { Faker::Name.name }
    trait :without_name do
      title { nil }
    end
  end
end