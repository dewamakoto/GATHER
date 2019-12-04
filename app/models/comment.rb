class Comment < ApplicationRecord

	belongs_to :comment
	belongs_to :user
	acts_as_paranoid
end
