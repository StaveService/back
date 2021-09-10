Mobility.locale = :ja
Album.seed(:id,
           {
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
           }.map.with_index(1) do |(k, v), i|
             FactoryBot.attributes_for(:album, id: i, title: k, link_attributes: { itunes: v })
           end)
