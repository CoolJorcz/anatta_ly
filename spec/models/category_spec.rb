require 'spec_helper'

describe Category do
  let(:category) { FactoryGirl.create(:category) }

  it { should have_many(:items) }
  it { should validate_presence_of(:name) }
end
