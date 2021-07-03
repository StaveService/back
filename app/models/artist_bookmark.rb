class ArtistBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :artist, counter_cache: :bookmarks_count
end
