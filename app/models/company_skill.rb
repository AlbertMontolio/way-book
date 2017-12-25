class CompanySkill < ApplicationRecord
	has_many :pairs, dependent: :destroy
end
