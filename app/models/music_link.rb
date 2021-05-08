class MusicLink < ApplicationRecord
  belongs_to :music
  belongs_to :platform
end
