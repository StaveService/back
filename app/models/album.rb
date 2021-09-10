class Album < ApplicationRecord
  has_one :link, class_name: :AlbumLink, dependent: :destroy
  has_many :musics, dependent: nil

  has_many :album_musics, dependent: nil
  has_many :musics, through: :album_musics

  has_many :band_albums, dependent: nil
  has_many :bands, through: :band_albums

  has_many :artist_albums, dependent: nil
  has_many :artists, through: :artist_albums

  has_many :album_bookmarks, dependent: :destroy
  has_many :bookmarks, through: :album_bookmarks, source: :album

  validates :title, presence: true, length: { maximum: 100 }

  accepts_nested_attributes_for :link

  extend Mobility
  translates :title, fallbacks: { en: :ja, ja: :en }
end
