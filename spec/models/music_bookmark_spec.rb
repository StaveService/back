require 'rails_helper'

RSpec.describe MusicBookmark, type: :model do
  context 'associations' do
    it { should belong_to :music }
    it { should belong_to :user }
  end
end
