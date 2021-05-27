require 'rails_helper'

RSpec.describe ArtistLink, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :artist }
  end
end
