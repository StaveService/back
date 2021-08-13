ArtistAlbum.seed(:id,
                 (1..11).flat_map do |i|
                   (1..3).map do |j|
                     FactoryBot.attributes_for(:artist_album, id: i, artist: Artist.find(j), album: Album.find(i))
                   end
                 end)
