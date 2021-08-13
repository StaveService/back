ArtistMusic.seed(:id,
                 (1..11).flat_map do |i|
                   (1..3).map do |j|
                     FactoryBot.attributes_for(:artist_music, id: i, artist: Artist.find(j), music: Music.find(i))
                   end
                 end)

ArtistMusic.seed(:id,
                 (12..13).flat_map do |i|
                   FactoryBot.attributes_for(:artist_music, id: i, artist: Artist.find(4), music: Music.find(i))
                 end)
