class MusicBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :music, counter_cache: :bookmarks_count

  after_create :after_create_music_bookmark_notification

  def after_create_music_bookmark_notification
    return if user.id === self.music.user.id
    MusicBookmarkNotification.with(music_bookmark: self).deliver(self.music.user)
  end
end
