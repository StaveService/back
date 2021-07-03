class AlbumBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :album, counter_cache: :bookmarks_count
end
