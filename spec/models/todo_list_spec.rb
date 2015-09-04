require 'spec_helper'

describe TodoList do
  context "relationships" do
    it { should have_many(:todo_items)}
    it { should belong_to(:user)}
  end
  describe "has completed items?" do
  	let(:todo_list) {TodoList.create(title: "Shopping", description: "Shopping List")}

  	it "returns true with completed todo list items" do
  		todo_list.todo_items.create(content: "Eggs", completed_at: 1.minute.ago)
  		expect(todo_list.has_completed_items?).to be_truthy
  	end

  	it "returns false with no completed todo list items" do
  		todo_list.todo_items.create(content: "Eggs")
  		expect(todo_list.has_completed_items?).to be_falsey
  	end

  end

  describe "has incompleted items?" do
  	let(:todo_list) {TodoList.create(title: "Shopping", description: "Shopping List")}

  	it "returns true with incompleted todo list items" do
  		todo_list.todo_items.create(content: "Eggs")
  		expect(todo_list.has_incomplete_items?).to be_truthy
  	end

  	it "returns tfalse with no completed todo list items" do
  		todo_list.todo_items.create(content: "Eggs", completed_at: 1.minute.ago)
  		expect(todo_list.has_incomplete_items?).to be_falsey
  	end


  end

end
