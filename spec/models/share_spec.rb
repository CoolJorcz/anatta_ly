require 'spec_helper'

describe Share do
  let(:share) { FactoryGirl.create(:share) }

  it "should not be able to friend request yourself" do
    pending
  end

  it "there should be 0 or 1 friend connections between two users" do
    # can't request someone who is already a friend
    # can't request someone with a pending request out
    pending
  end

  it "friend approved state initializes to false" do
    pending
  end

  it "denying a friend request deletes that Friend entry" do
    pending
  end

  it { should belong_to(:item) }
  it { should belong_to(:borrower) }
  it { should validate_presence_of(:item_id) }
  it { should validate_presence_of(:borrower_id) }
  it { should validate_presence_of(:start_on) }
  it { should validate_presence_of(:end_on) }
  it { should validate_presence_of(:status) }
end
