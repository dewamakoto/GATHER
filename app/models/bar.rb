class Bar < ApplicationRecord

	has_many :favorites
	has_many :posts
	has_many :favorited_users, through: :favorites, source: :user

	validates :name, presence: true
	validates :address, presence: true
	validates :category, presence: true
	validates :sports, presence: true

	attachment :image
end
