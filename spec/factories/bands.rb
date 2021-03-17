FactoryBot.define do
  factory :band do
    name { Faker::Music.band }
  end
end
