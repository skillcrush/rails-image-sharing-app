FactoryGirl.define do 
	factory :pin do
	title "Rails Cheatsheet"
  	url "http://rails-cheat.com"
  	sequence (:slug) { |n| "slug#{n}"}
  	text "A great tool for beginning developers"	
  	category Category.find_by_name("rails")
	end


	factory :user do
	sequence (:email) { |n| "coder#{n}@skillcrush.com"}
	first_name "Skillcrush"
	last_name "Coder"
	password "Secret"

	after(:create) do |user|
		user.boards << FactoryGirl.create(:board)
    	3.times do
    		user.pinnings.create(pin: FactoryGirl.create(:pin), board: user.boards.first)
    	end
  	end
	end	

	factory :pinning do
		pin
		user
	end

	factory :board do
		name "My Pins!"
	end
end