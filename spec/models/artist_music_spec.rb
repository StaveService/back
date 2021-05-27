require 'rails_helper'

RSpec.describe ArtistMusic, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :artist }
    it { is_expected.to belong_to :music }
  end

  context 'attributes' do
    it 'has role' do
      expect(build(:artist_music, role: 0)).to have_attributes(role: 'vocal')
    end
  end
end
