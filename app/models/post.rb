class Post < ApplicationRecord

	has_many :notifications
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :bar

	attachment :image

	validates :sports, presence: true
	validates :title, presence: true
	validates :body, presence: true

	default_scope -> { order(created_at: :desc) }
end
