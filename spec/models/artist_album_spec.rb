require 'rails_helper'

RSpec.describe ArtistAlbum, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :artist }
    it { is_expected.to belong_to :album }
  end

  context 'attributes' do
    it 'has artist_id' do
      expect(build(:artist_album, artist_id: 1)).to have_attributes(artist_id: 1)
    end

    it 'has album_id' do
      expect(build(:artist_album, album_id: 1)).to have_attributes(album_id: 1)
    end
  end
end
