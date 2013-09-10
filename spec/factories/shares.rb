FactoryGirl.define do
  factory :share do
  	item_id 1  
  	borrower_id 2
  	start_on "2013-09-26 00:00:00"
  	end_on "2014-01-08 00:00:00"
  	status "pending"
  end
end