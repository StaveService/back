class Band < ApplicationRecord
  attr_accessor :current_user
  has_many :musics

  has_many :artist_bands
  has_many :artists, through: :artist_bands

  has_many :band_albums
  has_many :albums, through: :band_albums

  has_many :band_bookmarks
  has_many :bookmarks, through: :band_bookmarks, source: :band, dependent: :destroy

  validates_presence_of :name
end
