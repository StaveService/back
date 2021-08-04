class Music < ApplicationRecord
  has_one :link, class_name: :MusicLink, dependent: :destroy
  has_many :issues, dependent: :destroy

  has_many :artist_musics
  has_many :artists, through: :artist_musics, dependent: :destroy

  has_many :album_musics
  has_many :albums, through: :album_musics, dependent: :destroy

  has_many :lyrist_musics
  has_many :lyrists, through: :lyrist_musics, source: :artist, dependent: :destroy

  has_many :composer_musics
  has_many :composers, through: :composer_musics, source: :artist, dependent: :destroy

  has_many :music_bookmarks
  has_many :bookmarks, through: :music_bookmarks, source: :music, dependent: :destroy

  belongs_to :user
  belongs_to :band, optional: true

  validates :title, presence: true, length: { maximum: 50 }

  accepts_nested_attributes_for :link

  after_create :after_create_git
  after_destroy :after_destroy_git

  extend Mobility
  translates :title, fallbacks: { en: :ja, ja: :en }

  def after_create_git
    repo_path = Rails.root.join('repositories', user.id.to_s, "#{title}.git")
    FileUtils.mkdir_p(repo_path)
    repository = Rugged::Repository.init_at(repo_path, :bare)
    repository.config['http.receivepack'] = true
  end

  def after_destroy_git
    FileUtils.rm_rf(
      Rails.root.join('repositories', user.id.to_s, "#{title}.git")
    )
  end
end
