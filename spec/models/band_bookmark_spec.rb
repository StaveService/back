require 'rails_helper'

RSpec.describe BandBookmark, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :band }
    it { is_expected.to belong_to :user }
  end

  context 'when attributes' do
    it 'has band_id' do
      expect(build(:band_bookmark, band_id: 1)).to have_attributes(band_id: 1)
    end

    it 'has user_id' do
      expect(build(:band_bookmark, user_id: 1)).to have_attributes(user_id: 1)
    end
  end
end
