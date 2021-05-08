class Artist < ApplicationRecord
  attr_accessor :current_user
  has_many :artist_musics
  has_many :artists, through: :artist_musics

  has_many :artist_albums
  has_many :albums, through: :artist_albums

  has_many :artist_bands
  has_many :bands, through: :artist_bands

  has_many :artist_bookmarks
  has_many :bookmarks, through: :artist_stars,source: :artist, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 50 }

  def bookmark
    return artist_bookmarks.find_by(user_id: current_user.id) if current_user 
  end
end
