FactoryBot.define do
  factory :album do
    title { Faker::Name.name }
    country { "JP" }
    release_date { Date.today }
  end
end