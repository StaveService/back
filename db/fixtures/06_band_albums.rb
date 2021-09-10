BandAlbum.seed(:id,
               (1..11).map do |i|
                 FactoryBot.attributes_for(:band_album, id: i, band: Band.find(1), album: Album.find(i))
               end)
