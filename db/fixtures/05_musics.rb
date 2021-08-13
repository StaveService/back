Mobility.locale = :ja
Music.seed(:id,
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
           }.map.with_index(1) do |(k, v), i|
             FactoryBot.attributes_for(:music, id: i, user: User.find(1), band: Band.find(1), title: k,
                                               link_attributes: { itunes: v })
           end)

Music.seed(:id,
           %w[おしゃかしゃま 君と羊と青].map.with_index(12) do |v, i|
             FactoryBot.attributes_for(:music, id: i, user: User.find(2), band: Band.find(2), title: v,
                                               link_attributes: {})
           end)
