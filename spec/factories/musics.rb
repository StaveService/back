FactoryBot.define do
  factory :music do
    user { nil }
    title { Faker::Music::Phish.song[0..49] }
  end
end
