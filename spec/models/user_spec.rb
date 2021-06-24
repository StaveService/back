require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of :nickname }
    it { is_expected.to validate_presence_of :familyname }
    it { is_expected.to validate_presence_of :givenname }
    it { is_expected.to validate_length_of(:nickname).is_at_least(4).is_at_most(30) }
    it { is_expected.to validate_length_of(:familyname).is_at_most(35) }
    it { is_expected.to validate_length_of(:givenname).is_at_most(35) }
    it { is_expected.to validate_uniqueness_of :nickname }
  end

  context 'associations' do
    it { is_expected.to have_one(:link).class_name("UserLink").dependent(:destroy) }
    it { is_expected.to have_many(:musics) }
    it { is_expected.to have_many(:requests).dependent(:destroy) }
    it { is_expected.to have_many(:issues).dependent(:destroy) }
    it { is_expected.to have_many(:band_bookmarks) }
    it { is_expected.to have_many(:music_bookmarks) }
    it { is_expected.to have_many(:artist_bookmarks) }
    it { is_expected.to have_many(:bookmarked_bands).through(:band_bookmarks).source(:band).dependent(:destroy) }
    it { is_expected.to have_many(:bookmarked_musics).through(:music_bookmarks).source(:music).dependent(:destroy) }
    it { is_expected.to have_many(:bookmarked_artists).through(:artist_bookmarks).source(:artist).dependent(:destroy) }
  end

  context 'attributes' do
    it 'has nickname' do
      expect(build(:user, nickname: 'nickname')).to have_attributes(nickname: 'nickname')
    end

    it 'has family_name' do
      expect(build(:user, familyname: 'familyname')).to have_attributes(familyname: 'familyname')
    end

    it 'has give_name' do
      expect(build(:user, givenname: 'givenname')).to have_attributes(givenname: 'givenname')
    end

    it 'has introduction' do
      expect(build(:user, introduction: 'introduction')).to have_attributes(introduction: 'introduction')
    end

    it 'has birthday' do
      date = DateTime.now
      expect(build(:user, birthday: date)).to have_attributes(birthday: date)
    end
  end
end
