ComposerMusic.seed(:id,
                   (1..11).map do |i|
                     FactoryBot.attributes_for(:composer_music, id: i, artist: Artist.find(1), music: Music.find(i))
                   end)

ComposerMusic.seed(:id,
                   (12..13).map do |i|
                     FactoryBot.attributes_for(:composer_music, id: i, artist: Artist.find(4), music: Music.find(i))
                   end)
