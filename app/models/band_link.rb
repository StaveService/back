class BandLink < ApplicationRecord
  belongs_to :band

  extend Mobility
  translates :wikipedia, fallbacks: { en: :ja, ja: :en }
end
