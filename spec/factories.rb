FactoryGirl.define do
	factory :user do
		first_name "Wendell"
		last_name "Borton"
		sequence(:email) { |n| "user#{n}@qwerty.com"}
		password "qwerty123"
		password_confirmation "qwerty123"
	end

	factory :todo_list do
		title "Todo List Title"
		description "Todo List Description"
		user
	end
end