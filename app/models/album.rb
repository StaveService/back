class Album < ApplicationRecord
    belongs_to :artist
    validates :title, presence: true, length: 1..100
end
