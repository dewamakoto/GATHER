class Favorite < ApplicationRecord

	belongs_to :user
	belongs_to :bar
	validates_uniqueness_of :bar_id, scope: :user_id

	def favorited_by?(user,bar)
   		Favorite.where(user_id: user.id).where(bar_id: bar.id).exists?
  	end
end
