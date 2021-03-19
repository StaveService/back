require 'rails_helper'

RSpec.describe Composer, type: :model do
  context 'associations' do
    it { should belong_to :artist }
    it { should belong_to :music }
  end
end
