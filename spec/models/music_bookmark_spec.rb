require 'rails_helper'

RSpec.describe MusicBookmark, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :music }
    it { is_expected.to belong_to :user }
  end

  context 'when attributes' do
    it 'has music_id' do
      expect(build(:music_bookmark, music_id: 1)).to have_attributes(music_id: 1)
    end

    it 'has user_id' do
      expect(build(:music_bookmark, user_id: 1)).to have_attributes(user_id: 1)
    end
  end
end
