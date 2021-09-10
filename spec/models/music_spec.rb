require 'rails_helper'

RSpec.describe Music, type: :model do
  context 'when validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_length_of(:title).is_at_most(50) }
  end

  context 'when associations' do
    it { is_expected.to have_one(:link).class_name('MusicLink').dependent(:destroy) }
    it { is_expected.to have_many(:issues).dependent(:destroy) }
    it { is_expected.to have_many(:artist_musics).dependent(nil) }
    it { is_expected.to have_many(:album_musics).dependent(nil) }
    it { is_expected.to have_many(:lyrist_musics).dependent(nil) }
    it { is_expected.to have_many(:composer_musics).dependent(nil) }
    it { is_expected.to have_many(:music_bookmarks).dependent(:destroy) }
    it { is_expected.to have_many(:artists).through(:artist_musics) }
    it { is_expected.to have_many(:albums).through(:album_musics) }
    it { is_expected.to have_many(:lyrists).through(:lyrist_musics).source(:artist) }
    it { is_expected.to have_many(:composers).through(:composer_musics).source(:artist) }
    it { is_expected.to have_many(:bookmarks).through(:music_bookmarks).source(:music) }
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to(:band).optional }
  end

  context 'when attributes' do
    it 'has title' do
      expect(build(:music, title: 'title')).to have_attributes(title: 'title')
    end

    it 'has user_id' do
      expect(build(:music, user_id: 1)).to have_attributes(user_id: 1)
    end

    it 'has band_id' do
      expect(build(:music, band_id: 1)).to have_attributes(band_id: 1)
    end

    it 'has bookmarks_count' do
      expect(build(:music)).to have_attributes(bookmarks_count: 0)
    end
  end
end
