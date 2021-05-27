require 'rails_helper'

RSpec.describe MusicBookmark, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :music }
    it { is_expected.to belong_to :user }
  end
end
