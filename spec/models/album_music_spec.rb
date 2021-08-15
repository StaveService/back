require 'rails_helper'

RSpec.describe AlbumMusic, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :album }
    it { is_expected.to belong_to :music }
  end

  context 'when attributes' do
    it 'has music_id' do
      expect(build(:album_music, music_id: 1)).to have_attributes(music_id: 1)
    end

    it 'has album_id' do
      expect(build(:album_music, album_id: 1)).to have_attributes(album_id: 1)
    end
  end
end
