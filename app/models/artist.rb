class Artist < ApplicationRecord
  has_one :artist_link

  has_many :artist_musics
  has_many :musics, through: :artist_musics

  has_many :artist_albums
  has_many :albums, through: :artist_albums

  has_many :artist_bands
  has_many :bands, through: :artist_bands

  has_many :artist_bookmarks
  has_many :bookmarks, through: :artist_bookmarks, source: :artist, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  accepts_nested_attributes_for :artist_link
end
