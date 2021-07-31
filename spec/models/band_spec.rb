require 'rails_helper'

RSpec.describe Band, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  context 'associations' do
    it { is_expected.to have_one(:link).class_name(:BandLink).dependent(:destroy) }
    it { is_expected.to have_many :musics }
    it { is_expected.to have_many :artist_bands }
    it { is_expected.to have_many :band_albums }
    it { is_expected.to have_many :band_bookmarks }
    it { is_expected.to have_many(:artists).through(:artist_bands) }
    it { is_expected.to have_many(:albums).through(:band_albums) }
    it { is_expected.to have_many(:bookmarks).through(:band_bookmarks).source(:band).dependent(:destroy) }
  end

  context 'attributes' do
    it 'has name' do
      expect(build(:band, name: 'band')).to have_attributes(name: 'band')
    end

    it 'has bookmarks_count' do
      expect(build(:band)).to have_attributes(bookmarks_count: 0)
    end
  end
end
