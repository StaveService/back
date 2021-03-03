require 'rails_helper'

RSpec.describe Artist, type: :model do
  
  context "validations" do
    it { should validate_presence_of :name }
  end
end
