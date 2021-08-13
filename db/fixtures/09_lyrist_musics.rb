LyristMusic.seed(:id,
                 (1..11).map do |i|
                   FactoryBot.attributes_for(:lyrist_music, id: i, artist: Artist.find(1), music: Music.find(i))
                 end)

LyristMusic.seed(:id,
                   (12..13).map do |i|
                     FactoryBot.attributes_for(:lyrist_music, id: i, artist: Artist.find(4), music: Music.find(i))
                   end)
