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

	def self.filter_company_skills_by_category(sel_category)
		if sel_category["id"].nil?
			return CompanySkill.unique_name
		else
			filtered_company_skills = []
			CompanySkill.all.each do |company_skill|
			  filtered_company_skills << company_skill if company_skill.category.id == sel_category["id"]
			end
			return filtered_company_skills
		end
		
	end

end
