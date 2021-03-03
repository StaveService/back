class Music < ApplicationRecord
  belongs_to :artist
  belongs_to :user
  belongs_to :album
end
