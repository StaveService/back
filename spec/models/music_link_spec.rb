require 'rails_helper'

RSpec.describe MusicLink, type: :model do
  context 'associations' do
    it { should belong_to :music }
  end
end
