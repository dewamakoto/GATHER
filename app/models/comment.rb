class Comment < ApplicationRecord

	belongs_to :post
	belongs_to :user
	validates :body, presence: true
	acts_as_paranoid
end
