class Profile < ApplicationRecord
  belongs_to :user
  has_many :curriculums
  has_many :own_skills
  has_many :own_company_skills
  has_many :company_skills
  has_many :projects
  
  def self.filter_by_category_by_company_skills(sel_category, sel_company_skills)
    profiles = Profile.all
    profiles = Profile.filter_by_category(profiles, sel_category)
    return Profile.filter_by_company_skills(profiles, sel_company_skills)
  end

  def self.filter_by_category(profiles, sel_category)
    if sel_category["id"].nil?
  		profiles
  	elsif sel_category["name"].upcase == "ALL"
  		profiles
  	else
  		filtered_profiles = []
  		profiles.each do |profile|
  			own_category_names = profile.own_company_skills.map { |own_company_skill| own_company_skill.category.name }
  			filtered_profiles << profile if own_category_names.include? sel_category["name"]
  		end
  		return filtered_profiles
  	end
  end

  def self.filter_by_company_skills(profiles, sel_company_skills)
  	filtered_profiles = []
  	profiles.each do |profile|
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
