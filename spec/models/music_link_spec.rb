require 'rails_helper'

RSpec.describe MusicLink, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :music }
  end

  context 'attributes' do
    it 'has music_id' do
      expect(build(:music_link, music_id: 1)).to have_attributes(music_id: 1)
    end

    it 'has spotify' do
      expect(build(:music_link, spotify: 'spotify')).to have_attributes(spotify: 'spotify')
    end

    it 'has itunes' do
      expect(build(:music_link, itunes: 0)).to have_attributes(itunes: 0)
    end

    it 'has musixmatch' do
      expect(build(:music_link, musixmatch: 0)).to have_attributes(musixmatch: 0)
    end
  end
end
