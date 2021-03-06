class Album < ApplicationRecord
  has_one :link, class_name: :AlbumLink, dependent: :destroy
  has_many :musics

  has_many :album_musics
  has_many :musics, through: :album_musics

  has_many :band_albums
  has_many :bands, through: :band_albums

  has_many :artist_albums
  has_many :artists, through: :artist_albums

  has_many :album_bookmarks
  has_many :bookmarks, through: :album_bookmarks, source: :album, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }

  accepts_nested_attributes_for :link
end
