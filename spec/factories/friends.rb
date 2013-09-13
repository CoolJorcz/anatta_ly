FactoryGirl.define do
	factory :friend do
		requester_id 1
		receiver_id 2
		approved true
	end
end