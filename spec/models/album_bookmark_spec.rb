require 'rails_helper'

RSpec.describe AlbumBookmark, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :album }
    it { is_expected.to belong_to :user }
  end

  context 'when attributes' do
    it 'has album_id' do
      expect(build(:album_bookmark, album_id: 1)).to have_attributes(album_id: 1)
    end

    it 'has user_id' do
      expect(build(:album_bookmark, user_id: 1)).to have_attributes(user_id: 1)
    end
  end
end
