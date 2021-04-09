class BandAlbum < ApplicationRecord
  belongs_to :band
  belongs_to :album
end
