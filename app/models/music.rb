class Music < ApplicationRecord
  has_many :roles, dependent: :destroy
  has_many :issues, dependent: :destroy

  has_many :album_musics
  has_many :albums, through: :album_musics, dependent: :destroy

  has_many :lyrists
  has_many :music_lyrists, through: :lyrists, source: :artist, dependent: :destroy

  has_many :composers
  has_many :music_composers, through: :composers, source: :artist, dependent: :destroy

  has_many :music_stars
  has_many :stars, through: :music_stars, dependent: :destroy

  belongs_to :user
  belongs_to :band, optional: true

  validates :title, presence: true, length: { maximum: 50 }
end
