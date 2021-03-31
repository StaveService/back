FactoryBot.define do
  factory :music do
    user
    title { Faker::Music::Phish.song }
  end
end
