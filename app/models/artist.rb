class Artist < ApplicationRecord
  has_many :albums
  has_many :musics
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
end
