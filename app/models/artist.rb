class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: 1..100
end
