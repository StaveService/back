require 'rails_helper'

RSpec.describe Album, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_length_of(:title).is_at_most(100) }
  end

  context 'associations' do
    it { is_expected.to have_one(:link).class_name(:AlbumLink).dependent(:destroy) }
    it { is_expected.to have_many :musics }
    it { is_expected.to have_many :album_musics }
    it { is_expected.to have_many :band_albums }
    it { is_expected.to have_many :artist_albums }
    it { is_expected.to have_many(:musics).through(:album_musics) }
    it { is_expected.to have_many(:artists).through(:artist_albums) }
    it { is_expected.to have_many(:bands).through(:band_albums) }
  end

  context 'attributes' do
    it 'has title' do
      expect(build(:album, title: 'title')).to have_attributes(title: 'title')
    end

    it 'has bookmarks_count' do
      expect(build(:album)).to have_attributes(bookmarks_count: 0)
    end
  end
end
