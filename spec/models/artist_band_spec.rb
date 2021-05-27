require 'rails_helper'

RSpec.describe ArtistBand, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :artist }
    it { is_expected.to belong_to :band }
  end
end
