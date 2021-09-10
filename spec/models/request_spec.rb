require 'rails_helper'

RSpec.describe Request, type: :model do
  context 'when validations' do
    it { is_expected.to validate_presence_of :title }
  end

  context 'when associations' do
    it { is_expected.to belong_to :user }
  end

  context 'when attributes' do
    it 'has title' do
      expect(build(:request, title: 'title')).to have_attributes(title: 'title')
    end
  end
end
