class Artist < ApplicationRecord
  has_many :roles
  has_many :musics, through: :roles

  has_many :artist_albums
  has_many :albums, through: :artist_albums

  has_many :artist_bands
  has_many :bands, through: :artist_bands
  
  validates :name, presence: true, length: { maximum: 50 }
end
