require 'rails_helper'

RSpec.describe ArtistBand, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :artist }
    it { is_expected.to belong_to :band }
  end

  context 'when attributes' do
    it 'has artist_id' do
      expect(build(:artist_band, artist_id: 1)).to have_attributes(artist_id: 1)
    end

    it 'has band_id' do
      expect(build(:artist_band, band_id: 1)).to have_attributes(band_id: 1)
    end
  end
end
