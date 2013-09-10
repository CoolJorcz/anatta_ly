require 'spec_helper'

describe User do
	let(:user) { FactoryGirl.create(:user) }
  it "sets a session variable to the OmniAuth auth hash" do
    request.env["omniauth.auth"][:uid].should == '123456789'
  end

  it "sets a 60 day auth-token" do
  end

  it { should have_many(:items) }
  it { should have_many(:friends) }
  it { should have_many(:shares).through(:items) }
  it { should have_many(:borrows) }
  it { should have_many(:friends)}
end
