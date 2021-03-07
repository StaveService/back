# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  has_one :artist
  has_many :musics, dependent: :destroy
  validates :nickname, length: 4..30
  validates :first_name, length: { maximum: 35 }
  validates :last_name, length: { maximum: 35 }
  validates_presence_of :nickname, :first_name, :last_name
  validates_uniqueness_of :nickname
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
