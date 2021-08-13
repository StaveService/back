class ArtistLink < ApplicationRecord
  belongs_to :artist

  extend Mobility
  translates :wikipedia, fallbacks: { en: :ja, ja: :en }
end
