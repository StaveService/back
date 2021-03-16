class Issue < ApplicationRecord
  belongs_to :music
  belongs_to :user
  validates_presence_of :title, :description
end
