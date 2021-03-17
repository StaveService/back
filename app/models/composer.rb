class Composer < ApplicationRecord
  belongs_to :artist
  belongs_to :music
end
