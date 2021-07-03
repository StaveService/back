class MusicBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :music, counter_cache: :bookmarks_count 
end
