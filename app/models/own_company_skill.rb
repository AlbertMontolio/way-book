class OwnCompanySkill < ApplicationRecord
  belongs_to :profile
  belongs_to :category

  def self.unique_name
  	@own_company_skills_uniq = []
  	@own_company_skills_names_uniq = []

  	self.all.each do |own_company_skill|
  		unless @own_company_skills_names_uniq.include? own_company_skill.name
  			### ? wofür brauche ich das?
  			@own_company_skills_names_uniq << own_company_skill.name
  			@own_company_skills_uniq << own_company_skill
  		end
  	end
  	return @own_company_skills_uniq
  end
end
