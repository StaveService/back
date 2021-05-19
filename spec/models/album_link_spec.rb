require 'rails_helper'

RSpec.describe AlbumLink, type: :model do
  context 'associations' do
    it { should belong_to :album }
  end
end
