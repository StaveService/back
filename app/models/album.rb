class Album < ApplicationRecord
    has_many :musics
    validates :title, presence: true, length: { maximum: 100 }
end
