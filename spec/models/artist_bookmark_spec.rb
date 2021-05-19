require 'rails_helper'

RSpec.describe ArtistBookmark, type: :model do
  context 'associations' do
    it { should belong_to :artist }
    it { should belong_to :user }
  end
end
