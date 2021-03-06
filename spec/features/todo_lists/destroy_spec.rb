require 'spec_helper'

describe 'Editing todo lists' do
	let(:user) {todo_list.user}
	let!(:todo_list) {create(:todo_list)}

	before do
		sign_in user, password: "qwerty123"
	end

	it "it successful deletes a list on click" do
		visit "/todo_lists"

		within "#todo_list_#{todo_list.id}" do
			click_link "Delete"
		end

		expect(page).to_not have_content(todo_list.title)
		expect(TodoList.count).to eq(0)

	end

end