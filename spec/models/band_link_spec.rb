require 'rails_helper'

RSpec.describe BandLink, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :band }
  end

  context 'attributes' do
    it 'has twitter' do
      expect(build(:band_link, twitter: 'twitter')).to have_attributes(twitter: 'twitter')
    end

    it 'has spotify' do
      expect(build(:band_link, spotify: 'spotify')).to have_attributes(spotify: 'spotify')
    end

    it 'has itunes' do
      expect(build(:band_link, itunes: 0)).to have_attributes(itunes: 0)
    end
  end
end
