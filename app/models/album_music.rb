class AlbumMusic < ApplicationRecord
  belongs_to :album
  belongs_to :music
end
