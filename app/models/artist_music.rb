class ArtistMusic < ApplicationRecord
  belongs_to :artist
  belongs_to :music
  enum role: {
    vocal: 0,
    guitar: 1,
    base: 2,
    drum: 3,
    vocal_guitar: 4,
    vocal_base: 5
  }
end
