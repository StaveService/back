class ArtistBand < ApplicationRecord
  belongs_to :artist
  belongs_to :band
  validates_presence_of :artist_id, :band_id
end
