class Album < ApplicationRecord
  has_one :album_link
  has_many :musics

  has_many :album_musics
  has_many :musics, through: :album_musics

  has_many :band_albums
  has_many :bands, through: :band_albums

  has_many :artist_albums
  has_many :artists, through: :artist_albums

  validates :title, presence: true, length: { maximum: 100 }

  accepts_nested_attributes_for :album_link
end
