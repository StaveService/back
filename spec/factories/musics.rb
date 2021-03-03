FactoryBot.define do
  factory :music do
    artist { nil }
    user { nil }
    album { nil }
    title { "MyString" }
    composer { "MyString" }
    lyrist { "MyString" }
    bpm { "" }
    time { "2021-03-03 17:09:17" }
  end
end
