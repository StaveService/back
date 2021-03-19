# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

# Ling tosite Sigure
band1= Band.create(name: "Ling tosite Sigure")
artist1 = Artist.create(name: "TK")
artist2 = Artist.create(name: "345")
artist3 = Artist.create(name: "ピエール中野")
FactoryBot.create(:artist_band, artist: artist1, band: band1)
FactoryBot.create(:artist_band, artist: artist2, band: band1)
FactoryBot.create(:artist_band, artist: artist3, band: band1)

user1 = FactoryBot.create(:user)
user1_music1 = FactoryBot.create(:music, user: user1, band: band1, title: "abnormalize") 
FactoryBot.create(:composer, artist: artist1 , music: user1_music1)
FactoryBot.create(:lyrist, artist: artist1 , music: user1_music1)
FactoryBot.create(:role, artist: artist1, music: user1_music1, role: 1)
FactoryBot.create(:role, artist: artist2, music: user1_music1, role: 2)
FactoryBot.create(:role, artist: artist3, music: user1_music1, role: 3)

user1_music2 = FactoryBot.create(:music, user: user1, band: band1, title: "Enigmatic Feeling") 
FactoryBot.create(:composer, artist: artist1 , music: user1_music2)
FactoryBot.create(:lyrist, artist: artist1 , music: user1_music2)
FactoryBot.create(:role, artist: artist1, music: user1_music2, role: 1)
FactoryBot.create(:role, artist: artist2, music: user1_music2, role: 2)
FactoryBot.create(:role, artist: artist3, music: user1_music2, role: 3)


# RADWIMPS

band2 = Band.create(name: "RADWIMPS")
artist4 = Artist.create(name: "野田 洋二郎")
FactoryBot.create(:artist_band, artist: artist4, band: band2)

user2 = FactoryBot.create(:user)
user2_music1 = FactoryBot.create(:music, user: user2, band: band2, title: "おしゃかしゃま") 
FactoryBot.create(:composer, artist: artist4 , music: user2_music1)
FactoryBot.create(:lyrist, artist: artist4 , music: user2_music1)
FactoryBot.create(:role, artist: artist4, music: user2_music1, role: 1)

user2_music2 = FactoryBot.create(:music, user: user2, band: band2, title: "君と青と羊") 
FactoryBot.create(:composer, artist: artist4 , music: user2_music2)
FactoryBot.create(:lyrist, artist: artist4 , music: user2_music2)
FactoryBot.create(:role, artist: artist4, music: user2_music2, role: 1)

# Test User
User.create(email: "test@test.com", familyname: "test", givenname: "tester", nickname: "IamTester", password: "password", password_confirmation: "password")