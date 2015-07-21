require 'spec_helper'

describe "Editing todo items" do
	
	let!(:todo_list) { TodoList.create(title: "Shopping", description: "Shopping List")}
	let!(:todo_list) {todo_list.todo_items.create(content: "Butter")}

	def visit_todo_list(list)
		visit "/todo_lists"
		within "#todo_list_#{list.id}" do
			click_link "List Items"
		end
	end

	it "is successful with valid content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link "Edit"
		end
		fill_in "Content", with: "More Butter"
		click_button "Save"
		expect(page).to have_content("Saved todo list item.")
		todo_item.reload
		expect(todo_item.content).to eq("More Butter")
	end

	it "is unsuccessful with no content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link "Edit"
		end
		fill_in "Content", with: ""
		click_button "Save"
		expect(page).to_not have_content("Saved todo list item.")
		expect(page).to have_content("Content can't be blank")
		todo_item.reload
		expect(todo_item.content).to eq("Butter")
	end

end