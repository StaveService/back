require 'rails_helper'

RSpec.describe ArtistLink, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :artist }
  end

  context 'attributes' do
    it 'has artist_id' do
      expect(build(:artist_link, artist_id: 1)).to have_attributes(artist_id: 1)
    end

    it 'has twitter' do
      expect(build(:artist_link, twitter: 'twitter')).to have_attributes(twitter: 'twitter')
    end

    it 'has spotify' do
      expect(build(:artist_link, spotify: 'spotify')).to have_attributes(spotify: 'spotify')
    end

    it 'has itunes' do
      expect(build(:artist_link, itunes: 0)).to have_attributes(itunes: 0)
    end
  end
end
