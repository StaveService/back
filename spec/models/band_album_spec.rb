require 'rails_helper'

RSpec.describe BandAlbum, type: :model do
  context 'associations' do
    it { should belong_to :band }
    it { should belong_to :album }
  end
end
