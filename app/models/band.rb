class Band < ApplicationRecord
  has_one :link, class_name: :BandLink, dependent: :destroy
  has_many :musics, dependent: nil

  has_many :artist_bands, dependent: nil
  has_many :artists, through: :artist_bands

  has_many :band_albums, dependent: nil
  has_many :albums, through: :band_albums

  has_many :band_bookmarks, dependent: :destroy
  has_many :bookmarks, through: :band_bookmarks, source: :band

  validates :name, presence: true

  accepts_nested_attributes_for :link

  extend Mobility
  translates :name, fallbacks: { en: :ja, ja: :en }
end
