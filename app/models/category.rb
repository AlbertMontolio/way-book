class Category < ApplicationRecord
	has_many :company_skills
	has_many :own_company_skills

	def self.filter
		
	end
end
