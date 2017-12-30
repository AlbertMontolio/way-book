class CompanySkill < ApplicationRecord
	belongs_to :category

	def self.unique_name
		@company_skills_uniq = []
		@company_skills_names_uniq = []

		CompanySkill.all.each do |company_skill|
			unless @company_skills_names_uniq.include? company_skill.name
				@company_skills_names_uniq << company_skill.name
				@company_skills_uniq << company_skill
			end
		end
		return @company_skills_uniq
	end
end
