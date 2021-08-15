require 'rails_helper'

RSpec.describe BandAlbum, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :band }
    it { is_expected.to belong_to :album }
  end

  context 'when attributes' do
    it 'has band_id' do
      expect(build(:band_album, band_id: 1)).to have_attributes(band_id: 1)
    end

    it 'has album_id' do
      expect(build(:band_album, album_id: 1)).to have_attributes(album_id: 1)
    end
  end
end
