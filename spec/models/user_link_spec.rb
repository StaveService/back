require 'rails_helper'

RSpec.describe UserLink, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :user }
  end

  context 'attributes' do
    it 'has twitter' do
      expect(build(:user_link, twitter: 'twitter')).to have_attributes(twitter: 'twitter')
    end
  end
end
