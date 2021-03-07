require 'rails_helper'

RSpec.describe ArtistMusic, type: :model do
  context 'associations' do
    it { should belong_to(:artist) }
    it { should belong_to(:music) }
  end
end
