require 'rails_helper'

RSpec.describe ArtistMusic, type: :model do
  context "validations" do
    it { should validate_presence_of :artist_id }
    it { should validate_presence_of :music_id}
  end

  context 'associations' do
    it { should belong_to :artist }
    it { should belong_to :music }
  end
end
