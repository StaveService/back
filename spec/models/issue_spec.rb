require 'rails_helper'

RSpec.describe Issue, type: :model do
  context 'when associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :music }
  end

  context 'when attributes' do
    it 'has user_id' do
      expect(build(:issue, user_id: 1)).to have_attributes(user_id: 1)
    end

    it 'has music_id' do
      expect(build(:issue, music_id: 1)).to have_attributes(music_id: 1)
    end

    it 'has title' do
      expect(build(:issue, title: 'title')).to have_attributes(title: 'title')
    end

    it 'has description' do
      expect(build(:issue, description: 'description')).to have_attributes(description: 'description')
    end
  end
end
