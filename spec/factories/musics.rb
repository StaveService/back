FactoryBot.define do
  factory :music do
    add_attribute(:length) { "length" }
    association :user
    association :album
    title { "MyString" }
    bpm { 120 }
  end
end
