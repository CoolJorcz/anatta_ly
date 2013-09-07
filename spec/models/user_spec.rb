require 'spec_helper'

describe User do

  it { should have_many(:items) }
  it { should have_many(:friends) }

  it "is created after facebook login" do
    pending
  end
end
