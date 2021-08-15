require 'rails_helper'

RSpec.describe ArtistBookmark, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :artist }
    it { is_expected.to belong_to :user }
  end

  context 'when attributes' do
    it 'has artist_id' do
      expect(build(:artist_bookmark, artist_id: 1)).to have_attributes(artist_id: 1)
    end

    it 'has user_id' do
      expect(build(:artist_bookmark, user_id: 1)).to have_attributes(user_id: 1)
    end
  end
end
