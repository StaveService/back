Mobility.locale = :ja
Artist.seed(:id,
            %w[TK 345 ピエール中野 野田洋二郎].map.with_index(1) do |v, i|
              FactoryBot.attributes_for(:artist, id: i, name: v, link_attributes:{})
            end)
