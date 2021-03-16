class Band < ApplicationRecord
  has_many :artist_bands
  has_many :artists, through: :artist_bands
  has_many :musics
  validates_presence_of :name
end
