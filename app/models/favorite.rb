class Favorite < ApplicationRecord

	belongs_to :user
	belongs_to :bar
	validates_uniqueness_of :bar_id, scope: :user_id

end
