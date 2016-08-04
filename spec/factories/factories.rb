FactoryGirl.define do 
	factory :user do
	sequence (:email) { |n| "coder#{n}@skillcrush.com"}
	first_name "Skillcrush"
	last_name "Coder"
	password "Secret"
	end	
end