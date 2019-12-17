class Comment < ApplicationRecord

	belongs_to :post
	belongs_to :user
	has_many :notifications, dependent: :destroy
	validates :body, presence: true
	acts_as_paranoid

end
