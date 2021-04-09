class Band < ApplicationRecord
  has_many :musics

  has_many :artist_bands
  has_many :artists, through: :artist_bands

  has_many :band_albums
  has_many :albums, through: :band_albums

  has_many :band_stars
  has_many :stars, through: :band_stars

  validates_presence_of :name
end
