require 'spec_helper'

describe "logging in" do

	it "logs the user in and goes to the todo lists" do
		User.create(first_name: "Wendell", last_name: "Borton", email: "wendell@borton.com", password: "wendell1234", password_confirmation: "wendell1234")
		visit new_user_session_path
		fill_in "Email Address", with: "wendell@borton.com"
		fill_in "Password", with: "wendell1234"
		click_button "Log In"
		expect(page).to have_content("Todo List")
		expect(page).to have_content("You have logged in")
	end

	it "displays the email address in the event of a failed login" do
		visit new_user_session_path
		fill_in "Email Address", with: "wendell@borton.com"
		fill_in "Password", with: "incorrect"
		click_button "Log In"
		expect(page).to have_content("Check your email and password")
		expect(page).to have_field("Email Address", with: "wendell@borton.com")
	end
end