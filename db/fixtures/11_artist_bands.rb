ArtistBand.seed(:id,
                (1..3).map do |i|
                  FactoryBot.attributes_for(:artist_band, id: i, artist: Artist.find(i), band: Band.find(1))
                end)

ArtistBand.seed(:id,
                FactoryBot.attributes_for(:artist_band, id: 4, artist: Artist.find(4), band: Band.find(2)))
