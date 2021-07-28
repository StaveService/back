# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

# Ling tosite Sigure
band1 = Band.create(name: 'Ling tosite sigure', link_attributes: {})
albums1 = {
  "#4": nil,
  "i'mperfect": 1_535_532_368,
  "Just a Moment": 1_354_895_875,
  "Es or S - EP": 1_033_053_633,
  "Still a Sigure Virgin?": 1_354_895_841,
  "Inspiration is DEAD": 1_339_494_519,
  "Feeling your UFO - EP": 1_340_075_005,
  "Telecastic fake show - Single": 1_339_490_655,
  "Die Meets Hard - Single": 1_268_523_116,
  "Abnormalize - Single": 1_354_894_273,
  "Perfake Perfect - Single": 1_545_119_206
}.map do |k, v|
  album = Album.create title: k
  FactoryBot.create(:album_link, album: album, itunes: v)
  FactoryBot.create(:band_album, album: album, band: band1)
  album
end
user1 = FactoryBot.create(:user)
artists1 = %w[TK 345 ピエール中野].map { |v| Artist.create name: v, link_attributes: {} }
artists1.each do |v|
  FactoryBot.create(:artist_album, artist: v, album: albums1[0])
  FactoryBot.create(:artist_band, artist: v, band: band1)
end
{
  "Abnormalize": 1_535_532_370,
  "Enigmatic Feeling": 941_516_387,
  "O.F.T": 1_339_500_372,
  "Chocolate Passion": 1_341_020_205,
  "Telecastic Fake Show": 1_354_895_889,
  "DISCO FLIGHT": 1_339_494_678,
  "Sosos": 1_033_054_073,
  "Who What Who What": 1_351_201_802,
  "Karma Siren": 1_033_054_076,
  "Beautiful Circus": 1_535_532_369,
  "Ultra Overcorrection": 1_341_020_204
}.each do |k, v|
  music = FactoryBot.create(:music, user: user1, band: band1, title: k)
  FactoryBot.create(:music_link, music: music, itunes: v)
  %i[composer_music lyrist_music].each do |v|
    FactoryBot.create(v, artist: artists1[0], music: music)
  end
  artists1.each_with_index do |v, i|
    FactoryBot.create(:artist_music, artist: v, music: music, role: ++i)
  end
end

# RADWIMPS
band2 = Band.create(name: 'RADWIMPS', link_attributes: {})
artist4 = Artist.create(name: '野田 洋二郎', link_attributes: {})
FactoryBot.create(:artist_band, artist: artist4, band: band2)

user2 = FactoryBot.create(:user)
user2_music1 = FactoryBot.create(:music, user: user2, band: band2, title: 'おしゃかしゃま', link_attributes: {})
FactoryBot.create(:composer_music, artist: artist4, music: user2_music1)
FactoryBot.create(:lyrist_music, artist: artist4, music: user2_music1)
FactoryBot.create(:artist_music, artist: artist4, music: user2_music1, role: 1)

user2_music2 = FactoryBot.create(:music, user: user2, band: band2, title: '君と青と羊', link_attributes: {})
FactoryBot.create(:composer_music, artist: artist4, music: user2_music2)
FactoryBot.create(:lyrist_music, artist: artist4, music: user2_music2)
FactoryBot.create(:artist_music, artist: artist4, music: user2_music2, role: 1)

# Test User
User.create(email: 'test@test.com', familyname: 'test', givenname: 'tester', nickname: 'IamTester',
            password: 'password', password_confirmation: 'password')
