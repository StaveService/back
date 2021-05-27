require 'rails_helper'

RSpec.describe AlbumMusic, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :album }
    it { is_expected.to belong_to :music }
  end
end
