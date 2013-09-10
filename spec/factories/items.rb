FactoryGirl.define do
	factory :item do 
		name "Apple"
		description "It's red!"
		size "Large"
		color "Red"
		attachment :image => File.new(Rails.root + 'public/system/items/images/')
	end
end