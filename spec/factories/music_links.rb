FactoryBot.define do
  factory :music_link do
    itunes { 1 }
    twitter { "MyString" }
    music { nil }
  end
end
