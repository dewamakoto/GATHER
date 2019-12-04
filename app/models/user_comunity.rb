class UserComunity < ApplicationRecord

	belongs_to :user
	belongs_to :comunity
	acts_as_paranoid
end
