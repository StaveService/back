require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'when validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
  end

  context 'when associations' do
    it { is_expected.to have_one(:link).class_name(:ArtistLink).dependent(:destroy) }
    it { is_expected.to have_many :artist_musics }
    it { is_expected.to have_many :artist_albums }
    it { is_expected.to have_many :artist_bands }
    it { is_expected.to have_many(:artist_bookmarks).dependent(:destroy) }
    it { is_expected.to have_many(:musics).through(:artist_musics) }
    it { is_expected.to have_many(:albums).through(:artist_albums) }
    it { is_expected.to have_many(:bands).through(:artist_bands) }
    it { is_expected.to have_many(:bookmarks).through(:artist_bookmarks).source(:artist) }
  end

  context 'when attributes' do
    it 'has name' do
      expect(build(:artist, name: 'artist')).to have_attributes(name: 'artist')
    end

    it 'has bookmarks_count' do
      expect(build(:artist)).to have_attributes(bookmarks_count: 0)
    end
  end
end
