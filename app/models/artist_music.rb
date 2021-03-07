class ArtistMusic < ApplicationRecord
  belongs_to :artist
  belongs_to :music
end
