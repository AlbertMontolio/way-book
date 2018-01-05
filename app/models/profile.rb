class Profile < ApplicationRecord
  belongs_to :user
  has_many :curriculums
  has_many :own_skills
  has_many :own_company_skills
  has_many :company_skills
  has_many :projects
  
  def self.filter_by_company_skills(sel_company_skills)
    ### refactor with activerecord or sql. it takes too long if all profiles!
    ### yo
  	filtered_profiles = []
  	Profile.all.each do |profile|
  		has_all_company_skills = true
  		sel_company_skills.each do |company_skill|
  			own_company_skills_names = profile.own_company_skills.map { |own_company_skill| own_company_skill.name }
  			has_all_company_skills = false unless own_company_skills_names.include? company_skill["name"]
  		end
  		filtered_profiles << profile if has_all_company_skills
  	end

  	return filtered_profiles
  end

end
