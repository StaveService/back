require 'rails_helper'

RSpec.describe ArtistLink, type: :model do
  context 'associations' do
    it { should belong_to :artist }
  end
end
