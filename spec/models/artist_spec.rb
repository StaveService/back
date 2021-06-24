require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
  end

  context 'associations' do
    it { is_expected.to have_one(:link).class_name(:ArtistLink).dependent(:destroy) }
    it { is_expected.to have_many :artist_musics }
    it { is_expected.to have_many :artist_albums }
    it { is_expected.to have_many :artist_bands }
    it { is_expected.to have_many :artist_bookmarks }
    it { is_expected.to have_many(:musics).through(:artist_musics) }
    it { is_expected.to have_many(:albums).through(:artist_albums) }
    it { is_expected.to have_many(:bands).through(:artist_bands) }
    it { is_expected.to have_many(:bookmarks).through(:artist_bookmarks).source(:artist).dependent(:destroy) }
  end

  context 'attributes' do
    it 'has name' do
      expect(build(:artist, name: 'artist')).to have_attributes(name: 'artist')
    end
  end
end
