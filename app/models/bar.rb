class Bar < ApplicationRecord

	has_many :favorites, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user

	validates :name, presence: true
	validates :address, presence: true
	validates :category, presence: true
	validates :sports, presence: true

	attachment :image

	geocoded_by :address
	after_validation :geocode

	def favorited_by?(user)
    self.favorites.where(user_id: user.id).exists?
  end
end
