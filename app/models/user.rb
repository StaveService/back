# frozen_string_literal: true

class User < ActiveRecord::Base
  has_one :artist
  extend Devise::Models
  validates :nickname, presence: true, uniqueness: true, length: 1..15
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
