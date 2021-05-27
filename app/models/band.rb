class Band < ApplicationRecord
  has_one :band_link
  has_many :musics

  has_many :artist_bands
  has_many :artists, through: :artist_bands

  has_many :band_albums
  has_many :albums, through: :band_albums

  has_many :band_bookmarks
  has_many :bookmarks, through: :band_bookmarks, source: :band, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :band_link
end
