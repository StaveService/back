# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

# Ling tosite Sigure
band1= Band.create(name: "Ling tosite sigure")
album1 = Album.create(title: "#4")
user1 = FactoryBot.create(:user)
artists1 = ["TK", "345", "ピエール中野"].map { |v| Artist.create name: v }
artists1.each do |v| 
    FactoryBot.create(:artist_album, artist: v, album: album1)
    FactoryBot.create(:artist_band, artist: v, band: band1)
end
{
    "Abnormalize": 1535532370, 
    "Enigmatic Feeling": 941516387, 
    "O.F.T": 1339500372,
    "Chocolate Passion": 1341020205,
    "Telecastic Fake Show": 1354895889,
    "DISCO FLIGHT": 1339494678,
    "Sosos": 1033054073,
    "Who What Who What": 1351201802,
    "Karma Siren": 1033054076,
    "Beautiful Circus": 1535532369,
    "Ultra Overcorrection": 1341020204
}.each do |k, v|
    music = FactoryBot.create(:music, user: user1, band: band1, title: k)
    FactoryBot.create(:music_link, music: music, itunes: v)
    [:composer_music, :lyrist_music].each do |v|
        FactoryBot.create(v, artist: artists1[0] , music: music)
    end
    artists1.each_with_index do |v, i|
        FactoryBot.create(:artist_music, artist: v, music: music, role: ++i)
    end
end


# RADWIMPS
band2 = Band.create(name: "RADWIMPS")
artist4 = Artist.create(name: "野田 洋二郎")
FactoryBot.create(:artist_band, artist: artist4, band: band2)

user2 = FactoryBot.create(:user)
user2_music1 = FactoryBot.create(:music, user: user2, band: band2, title: "おしゃかしゃま") 
FactoryBot.create(:composer_music, artist: artist4 , music: user2_music1)
FactoryBot.create(:lyrist_music, artist: artist4 , music: user2_music1)
FactoryBot.create(:artist_music, artist: artist4, music: user2_music1, role: 1)

user2_music2 = FactoryBot.create(:music, user: user2, band: band2, title: "君と青と羊") 
FactoryBot.create(:composer_music, artist: artist4 , music: user2_music2)
FactoryBot.create(:lyrist_music, artist: artist4 , music: user2_music2)
FactoryBot.create(:artist_music, artist: artist4, music: user2_music2, role: 1)

# Test User
User.create(email: "test@test.com", familyname: "test", givenname: "tester", nickname: "IamTester", password: "password", password_confirmation: "password")