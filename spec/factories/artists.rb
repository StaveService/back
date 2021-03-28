FactoryBot.define do
  factory :artist do
    name { Faker::Name.name }
    itunes_artist_id {1}
  end
end