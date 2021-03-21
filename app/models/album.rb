class Album < ApplicationRecord
    has_many :musics

    has_many :album_musics
    has_many :musics, through: :album_musics

    has_many :artist_albums
    has_many :artists, through: :artist_albums
    
    validates :title, presence: true, length: { maximum: 100 }
end
