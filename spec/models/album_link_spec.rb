require 'rails_helper'

RSpec.describe AlbumLink, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :album }
  end

  context 'attributes' do
    it 'has spotify' do
      expect(build(:album_link, spotify: 'spotify')).to have_attributes(spotify: 'spotify')
    end

    it 'has itunes' do
      expect(build(:album_link, itunes: 0)).to have_attributes(itunes: 0)
    end
  end
end
