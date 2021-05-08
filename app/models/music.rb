class Music < ApplicationRecord
  attr_accessor :current_user
  has_many :issues, dependent: :destroy

  has_many :artist_musics
  has_many :artists, through: :artist_musics, dependent: :destroy

  has_many :album_musics
  has_many :albums, through: :album_musics, dependent: :destroy

  has_many :lyrist_musics
  has_many :lyrists, through: :lyrist_musics, source: :artist, dependent: :destroy

  has_many :composer_musics
  has_many :composers, through: :composer_musics, source: :artist, dependent: :destroy

  has_many :music_bookmarks
  has_many :bookmarks, through: :music_bookmarks, source: :music, dependent: :destroy

  has_one :music_link
  has_one :link, through: :music_link, dependent: :destroy

  belongs_to :user
  belongs_to :band, optional: true

  validates :title, presence: true, length: { maximum: 50 }

  def bookmark
    return music_bookmarks.find_by(user_id: current_user.id) if current_user 
  end
end
