require 'rails_helper'

RSpec.describe BandAlbum, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :band }
    it { is_expected.to belong_to :album }
  end
end
