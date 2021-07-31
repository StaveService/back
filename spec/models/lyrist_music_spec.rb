require 'rails_helper'

RSpec.describe LyristMusic, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :artist }
    it { is_expected.to belong_to :music }
  end

  context 'attributes' do
    it 'has music_id' do
      expect(build(:lyrist_music, music_id: 1)).to have_attributes(music_id: 1)
    end

    it 'has artist_id' do
      expect(build(:lyrist_music, artist_id: 1)).to have_attributes(artist_id: 1)
    end
  end
end
