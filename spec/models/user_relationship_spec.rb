require 'rails_helper'

RSpec.describe UserRelationship, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:followed).class_name(:User) }
    it { is_expected.to belong_to(:follower).class_name(:User) }
  end
end
