require 'rails_helper'

RSpec.describe AlbumLink, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :album }
  end
end
