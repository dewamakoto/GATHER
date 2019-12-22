class Comunity < ApplicationRecord

	has_many :user, through: :user_comunities
	has_many :user_comunities
end
