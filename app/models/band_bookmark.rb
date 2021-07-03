class BandBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :band, counter_cache: :bookmarks_count
end
