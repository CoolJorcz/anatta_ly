require 'spec_helper'

describe Friend do
  let(:friend) { Friend.new(requester_id: 1,
                            receiver_id: 2,
                            approved: true) }

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

  it { should belong_to(:requester) }
  it { should belong_to(:receiver) }
  it { should validate_presence_of(:requester) }
  it { should validate_presence_of(:receiver) }

end
