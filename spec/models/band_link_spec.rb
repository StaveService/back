require 'rails_helper'

RSpec.describe BandLink, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :band }
  end

  context 'when attributes' do
    it 'has band_id' do
      expect(build(:band_link, band_id: 1)).to have_attributes(band_id: 1)
    end

    it 'has itunes' do
      expect(build(:band_link, itunes: 0)).to have_attributes(itunes: 0)
    end

    it 'has twitter' do
      expect(build(:band_link, twitter: 'twitter')).to have_attributes(twitter: 'twitter')
    end

    it 'has spotify' do
      expect(build(:band_link, spotify: 'spotify')).to have_attributes(spotify: 'spotify')
    end

    it 'has wikipedia' do
      expect(build(:band_link, wikipedia: '0')).to have_attributes(wikipedia: '0')
    end
  end
end
