class Album < ApplicationRecord
    has_many :musics
    belongs_to :artist
    validates :title, presence: true, length: { maximum: 100 }
end
