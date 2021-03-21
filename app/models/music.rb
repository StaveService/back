class Music < ApplicationRecord
  has_many :roles

  has_many :album_musics
  has_many :albums, through: :album_musics

  has_many :lyrists
  has_many :music_lyrists, through: :lyrists, source: :artist

  has_many :composers
  has_many :music_composers, through: :composers, source: :artist

  belongs_to :user
  belongs_to :band, optional: true
  validates :title, presence: true, length: { maximum: 50 }
end
