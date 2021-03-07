class Artist < ApplicationRecord
  has_many :artist_musics
  has_many :musics, through: :artist_musics
  validates :name, presence: true, length: { maximum: 50 }
end
