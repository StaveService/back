FactoryBot.define do
  factory :music do
    user
    album
    title { "MyString" }
    bpm { 120 }
    add_attribute(:length) { "length" }
  end
end
