class Profile < ApplicationRecord
  belongs_to :user
  has_many :curriculums
  has_many :own_skills
  has_many :own_company_skills
  has_many :company_skills
  has_many :projects

  def self.search(employee)
    ### how can i improve the ifs?
    ### put every if into a signle method i think
    names = employee.split(" ")

    if names.length == 1
      name = names.first.capitalize
      first_names = Profile.where("first_name like ?", "%" + name + "%")
      last_names = Profile.where("last_name like ?", "%" + name + "%")
      return last_names.empty? ? first_names : last_names
    end

    if names.length == 2
      first_name = names[0].capitalize
      last_name = names[1].capitalize

      # profile found?
      profile = Profile.where("first_name like ?", "%" + first_name + "%").where("last_name like ?", "%" + last_name + "%")

      # profile found
      if profile.any?
        return profile
      end
      # profile not found
      if profile.empty?
        first_names = Profile.where("first_name like ?", "%" + first_name + "%")
        last_names = Profile.where("last_name like ?", "%" + last_name + "%")

        return first_names + last_names
      end
    end

  end

  def self.is_profile_found?(employee)
    names = employee.split(" ")
    is_profile_found = false
    if names.length == 2
      first_name = names[0].capitalize
      last_name = names[1].capitalize

      profile = Profile.where("first_name like ?", "%" + first_name + "%").where("last_name like ?", "%" + last_name + "%")
      is_profile_found = true if profile.any?
    end

    return is_profile_found
  end
  
  #### method depricated, get rid of it
  # def self.filter_by_company_skills(sel_company_skills)
  #   ### refactor with activerecord or sql. it takes too long if all profiles!
  # 	filtered_profiles = []
  # 	Profile.all.each do |profile|
  # 		has_all_company_skills = true
  # 		sel_company_skills.each do |company_skill|
  # 			own_company_skills_names = profile.own_company_skills.map { |own_company_skill| own_company_skill.name }
  # 			has_all_company_skills = false unless own_company_skills_names.include? company_skill["name"]
  # 		end
  # 		filtered_profiles << profile if has_all_company_skills
  # 	end

  # 	return filtered_profiles
  # end

end
