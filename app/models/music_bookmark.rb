class MusicBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :music
end
