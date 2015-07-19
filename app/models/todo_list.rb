class TodoList < ActiveRecord::Base
	validates :title, presence: true
	# validates :title, length: { minimum: 2 }
end
