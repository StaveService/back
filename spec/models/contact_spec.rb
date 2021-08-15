require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'when attributes' do
    it 'has title' do
      expect(build(:contact, email: 'email')).to have_attributes(email: 'email')
    end

    it 'has description' do
      expect(build(:issue, description: 'description')).to have_attributes(description: 'description')
    end
  end
end
