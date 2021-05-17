FactoryBot.define do
  factory :music do
    user { nil }
    title { Faker::Music::Phish.song }
  end
end
