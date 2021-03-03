class Artist < ApplicationRecord
  has_many :albums
  belongs_to :user
  validates_presence_of :name
end
