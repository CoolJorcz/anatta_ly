require 'spec_helper'

describe User do
  it "is created after facebook login" do
    pending
  end

  it { should have_many(:items) }
  it { should have_many(:friends) }
end
