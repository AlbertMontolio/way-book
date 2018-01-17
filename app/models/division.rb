class Division < ApplicationRecord
	has_many :categories, dependent: :destroy
	has_many :profiles
end
