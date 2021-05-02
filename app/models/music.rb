class Music < ApplicationRecord
  attr_accessor :current_user
  has_many :roles, dependent: :destroy
  has_many :issues, dependent: :destroy

  has_many :album_musics
  has_many :albums, through: :album_musics, dependent: :destroy

  has_many :lyrists
  has_many :music_lyrists, through: :lyrists, source: :artist, dependent: :destroy

  has_many :composers
  has_many :music_composers, through: :composers, source: :artist, dependent: :destroy

  has_many :music_bookmarks
  has_many :bookmarks, through: :music_bookmarks, source: :music, dependent: :destroy

  belongs_to :user
  belongs_to :band, optional: true

  validates :title, presence: true, length: { maximum: 50 }

  def bookmark
    return music_bookmarks.find_by(user_id: current_user.id) if current_user 
  end
end
