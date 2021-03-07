class Music < ApplicationRecord
  has_many :artist_musics
  has_many :artists, through: :artist_musics
  belongs_to :user
  belongs_to :album
  validates :title, presence: true, length: { maximum: 50 }
end
