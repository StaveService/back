class Artist < ApplicationRecord
  has_many :albums
  belongs_to :user
end
