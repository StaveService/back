# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  has_one :link, class_name: :UserLink, dependent: :destroy

  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :musics, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :issues, dependent: :destroy

  has_many :band_bookmarks, dependent: :destroy
  has_many :bookmarked_bands, through: :band_bookmarks, source: :band

  has_many :music_bookmarks, dependent: :destroy
  has_many :bookmarked_musics, through: :music_bookmarks, source: :music

  has_many :artist_bookmarks, dependent: :destroy
  has_many :bookmarked_artists, through: :artist_bookmarks, source: :artist

  has_many :album_bookmarks, dependent: :destroy
  has_many :bookmarked_albums, through: :album_bookmarks, source: :album

  has_many :active_relationships, class_name: :UserRelationship,
                                  foreign_key: :follower_id,
                                  dependent: :destroy,
                                  inverse_of: :follower
  has_many :passive_relationships, class_name: :UserRelationship,
                                   foreign_key: :followed_id,
                                   dependent: :destroy,
                                   inverse_of: :followed
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :nickname, length: 4..30
  validates :familyname, length: { maximum: 35 }
  validates :givenname, length: { maximum: 35 }
  validates :nickname, :familyname, :givenname, presence: true
  validates :nickname, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  after_create :after_create_link

  def after_create_link
    create_link
  end
end
