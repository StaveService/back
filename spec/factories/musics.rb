FactoryBot.define do
  factory :music do
    user
    album
    title { Faker::Music::Phish.song }
    bpm { 120 }
    add_attribute(:length) { "3:00" }
  end
end
