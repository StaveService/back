require 'rails_helper'

RSpec.describe ArtistMusic, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :artist }
    it { is_expected.to belong_to :music }
  end

  context 'when attributes' do
    it 'has artist_id' do
      expect(build(:artist_music, artist_id: 1)).to have_attributes(artist_id: 1)
    end

    it 'has music_id' do
      expect(build(:artist_music, music_id: 1)).to have_attributes(music_id: 1)
    end

    it 'has role' do
      expect(build(:artist_music, role: 0)).to have_attributes(role: 'vocal')
    end
  end
end
