# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

artist = FactoryBot.create(:artist)
band = FactoryBot.create(:band)
10.times do 
  user = FactoryBot.create(:user)
  music = FactoryBot.create(:music, user: user, band: band)
  FactoryBot.create(:artist_music, artist: artist, music: music)
end

User.create(email: "test@test.com", familyname: "test", givenname: "tester", nickname: "IamTester", password: "password", password_confirmation: "password")