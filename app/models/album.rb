class Album < ApplicationRecord
    belongs_to :artist
    validates :name, presence: true, length: 1..100
end
