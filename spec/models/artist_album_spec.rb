require 'rails_helper'

RSpec.describe ArtistAlbum, type: :model do
  context 'associations' do
    it{ should belong_to :artist }
    it{ should belong_to :album }
  end
end
