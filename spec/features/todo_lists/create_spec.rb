require 'spec_helper'

describe "Creating todo lists" do
	it "redirects to todo list index on success" do
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: "My todo list"
		fill_in "Description", with: "This is a description"
		click_button "Create Todo list"
		expect(page).to have_content("My todo list")
	end

	it "displays an error when the todo list has no title" do
		expect(TodoList.count).to eq(0)
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: ""
		fill_in "Description", with: "This is a description"
		click_button "Create Todo list"
		expect(TodoList.count).to eq(0)
		expect(page).to have_content("error")

		visit "todo_lists"
		expect(page).to_not have_content("This is a description")
	end
	# it "displays an error when the title is less than 2 characters" do
	# 	expect(TodoList.count).to eq(0)
	# 	visit "/todo_lists"
	# 	click_link "New Todo list"
	# 	expect(page).to have_content("New Todo List")

	# 	fill_in "Title", with: "Hi"
	# 	fill_in "Description", with: "This is a description"
	# 	click_button "Create Todo list"
	# 	expect(TodoList.count).to eq(0)
	# 	expect(page).to have_content("error")

	# 	visit "todo_lists"
	# 	expect(page).to_not have_content("This is a description")
	# end
end