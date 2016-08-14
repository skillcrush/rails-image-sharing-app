FactoryGirl.define do 
	factory :pin do
	title "Rails Cheatsheet"
  	url "http://rails-cheat.com"
  	text "A great tool for beginning developers"
  	sequence :slug do |n| 
  		"slug#{n}"
	end
  	category Category.find_by_name("rails")
	end





	factory :user do
	sequence (:email) { |n| "coder#{n}@skillcrush.com"}
	first_name "Skillcrush"
	last_name "Coder"
	password "Secret"

	after(:create) do |user|
    	3.times do
    		user.pinnings.create(pin: FactoryGirl.create(:pin))
    	end
  	end
	end	

	factory :pinning do
		pin
		user
	end
end