FactoryBot.define do
  factory :album do
    title { Faker::Name.name }
    release_date { Date.today }
  end
end