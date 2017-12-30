class CompanySkillsController < ApplicationController

	def index

		@categories = Category.all
		@category = Category.new

		@company_skills = CompanySkill.all
		@company_skill = CompanySkill.new
	end

	def create
		raise
		@company_skill = CompanySkill.create(company_skills_strong_params)
		redirect_to company_skills_path
	end

	def filter_index_all_profiles_add_to_session
		@company_skill = CompanySkill.find(params[:company_skill_id].to_i)
		session[:company_skills] << @company_skill
		session[:company_skills] = session[:company_skills].uniq
		# raise
		@profiles = get_filtered_profiles
		@company_skills = CompanySkill.order(:name).unique_name

		respond_to do |format|
	        format.html
	        format.js
	    end
	end

	def filter_index_all_profiles_remove_from_session
		@company_skill = CompanySkill.find(params[:company_skill_id].to_i)

		session[:company_skills].each_with_index do |company_skill, index|
			if company_skill["name"] == @company_skill.name
				session[:company_skills].delete_at(index)
				# raise
			end
		end

		@profiles = get_filtered_profiles
		@company_skills = CompanySkill.order(:name).unique_name

		respond_to do |format|
	        format.html
	        format.js
	    end
	end

	def get_filtered_profiles
		
		@selected_company_skills = session[:company_skills]

		filtered_profiles = []
		Profile.all.each do |profile|

			has_all_company_skills = true
			@selected_company_skills.each do |company_skill|

				own_company_skills_names = profile.own_company_skills.map { |own_company_skill| own_company_skill.name }
			
				if own_company_skills_names.include? company_skill["name"]
					# nothing
				else
					has_all_company_skills = false
				end

			end

			if has_all_company_skills
				filtered_profiles << profile
			end
		end

		return filtered_profiles
	end

	private
	def company_skills_strong_params
		params.require(:company_skill).permit(:name)
	end
end
