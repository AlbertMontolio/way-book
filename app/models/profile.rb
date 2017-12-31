class Profile < ApplicationRecord
  belongs_to :user
  has_many :curriculums
  has_many :own_skills
  has_many :own_company_skills
  has_many :company_skills
  has_many :projects

  # def self.filter_by_category_by_company_skills(selected_category, selected_company_skills)
  # 	profiles = self.filter_by_category(selected_category)

  # 	return self.filter_by_company_skills(profiles, selected_company_skills)
  # end

  def self.filter_by_category(profiles, selected_category)
    if selected_category["id"].nil?
  		profiles
  	elsif selected_category["name"].upcase == "ALL"
  		profiles
  	else
  		filtered_profiles = []
  		profiles.each do |profile|
  			own_category_names = profile.own_company_skills.map { |own_company_skill| own_company_skill.category.name }
  			filtered_profiles << profile if own_category_names.include? selected_category["name"]
  		end
  		return filtered_profiles
  	end
  end

  def self.filter_by_company_skills(profiles, selected_company_skills)
  	filtered_profiles = []
  	profiles.each do |profile|
  		has_all_company_skills = true
  		selected_company_skills.each do |company_skill|
  			own_company_skills_names = profile.own_company_skills.map { |own_company_skill| own_company_skill.name }
  			has_all_company_skills = false unless own_company_skills_names.include? company_skill["name"]
  		end
  		filtered_profiles << profile if has_all_company_skills
  	end

  	return filtered_profiles
  end

end
