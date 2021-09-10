Mobility.locale = :ja
Band.seed(:id,
          %w[凛として時雨 RADWIMPS].map.with_index(1) do |v, i|
            FactoryBot.attributes_for(:band, id: i, name: v, link_attributes: {})
          end)
