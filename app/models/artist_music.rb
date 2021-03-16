class ArtistMusic < ApplicationRecord
  belongs_to :artist
  belongs_to :music
  validates_presence_of :artist_id, :music_id
end
