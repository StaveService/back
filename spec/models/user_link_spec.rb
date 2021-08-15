require 'rails_helper'

RSpec.describe UserLink, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :user }
  end

  context 'when attributes' do
    it 'has user_id' do
      expect(build(:user_link, user_id: 1)).to have_attributes(user_id: 1)
    end

    it 'has twitter' do
      expect(build(:user_link, twitter: 'twitter')).to have_attributes(twitter: 'twitter')
    end
  end
end
