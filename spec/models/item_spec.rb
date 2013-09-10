require 'spec_helper'

describe Item do
  let(:item) { FactoryGirl.create(:item) }


  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:image) }
end
