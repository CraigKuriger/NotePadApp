require 'spec_helper'

describe 'Editing todo lists' do

	let!(:todo_list) {		todo_list = TodoList.create(title: "Shopping", description: "Shopping List")}

	it "it successful deletes a list on click" do
		visit "/todo_lists"

		within "#todo_list_#{todo_list.id}" do
			click_link "Destroy"
		end

		expect(page).to_not have_content(todo_list.title)
		expect(TodoList.count).to eq(0)

	end

end