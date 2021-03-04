class Music < ApplicationRecord
  belongs_to :user
  belongs_to :album
  validates :title, length: { maximum: 50 }
  validates_presence_of :title
end
