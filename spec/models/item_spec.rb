require 'spec_helper'

describe Item do
  let(:item) { Item.new(name: "Canoe",
                        description: "Brand-new canoe. Only used a few times.",
                        color: "red",
                        user_id: 1 }


  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user_id) }

end
