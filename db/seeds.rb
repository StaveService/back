# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

10.times do 
  user = FactoryBot.create(:user)
  music = FactoryBot.create(:music, user: user)
  FactoryBot.create(:artist_music,  music: music)
end
