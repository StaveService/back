# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  has_many :musics
  has_many :requests
  has_many :issues

  has_many :band_bookmarks
  has_many :bookmarked_bands, through: :band_bookmarks, source: :user

  has_many :music_bookmarks
  has_many :bookmarked_musics, through: :music_bookmarks, source: :user

  has_many :artist_bookmarks
  has_many :bookmarked_artists, through: :artist_bookmarks, source: :user

  validates :nickname, length: 4..30
  validates :familyname, length: { maximum: 35 }
  validates :givenname, length: { maximum: 35 }
  validates_presence_of :nickname, :familyname, :givenname
  validates_uniqueness_of :nickname
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
