class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: { maximum: 100 }
end
