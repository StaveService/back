FactoryBot.define do
  factory :music do
    user { nil }
    album { nil }
    title { "MyString" }
    bpm { 120 }
    length { "" }
  end
end
