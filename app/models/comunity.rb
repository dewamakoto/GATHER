class Comunity < ApplicationRecord

	has_many :user, through: :user_comunities
	has_many :user_comunities
	accepts_nested_attributes_for :item_orders, allow_destroy: true
end
