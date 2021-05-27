require 'rails_helper'

RSpec.describe ArtistAlbum, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :artist }
    it { is_expected.to belong_to :album }
  end
end
