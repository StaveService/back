class Band < ApplicationRecord
  has_many :musics
  has_many :artist_bands
  has_many :artists, through: :artist_bands
  validates_presence_of :name
end
