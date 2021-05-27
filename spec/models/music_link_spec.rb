require 'rails_helper'

RSpec.describe MusicLink, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :music }
  end
end
