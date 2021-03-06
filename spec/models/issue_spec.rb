require 'rails_helper'

RSpec.describe Issue, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :music }
  end

  context 'attributes' do
    it 'has title' do
      expect(build(:issue, title: 'title')).to have_attributes(title: 'title')
    end

    it 'has description' do
      expect(build(:issue, description: 'description')).to have_attributes(description: 'description')
    end
  end
end
