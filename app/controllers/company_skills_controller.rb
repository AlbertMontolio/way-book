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
		selected_company_skills = session[:company_skills]
		selected_category = session[:category]

		profiles = Profile.all
		profiles = Profile.filter_by_category(profiles, selected_category)
		@profiles = Profile.filter_by_company_skills(profiles, selected_company_skills)

		# @company_skills = CompanySkill.order(:name).unique_name

		### 1 refactor, DRI
		@company_skills = []
		CompanySkill.all.each do |company_skill|
			@company_skills << company_skill if company_skill.category.id == selected_category["id"]
		end

		respond_to do |format|
	        format.html
	        format.js
	    end
	end

	def filter_index_all_profiles_remove_from_session
		@company_skill = CompanySkill.find(params[:company_skill_id].to_i)
		selected_category = session[:category]

		session[:company_skills].each_with_index do |company_skill, index|
			if company_skill["name"] == @company_skill.name
				session[:company_skills].delete_at(index)
				# raise
			end
		end

		selected_company_skills = session[:company_skills]

		profiles = Profile.all
		profiles = Profile.filter_by_category(profiles, selected_category)
		@profiles = Profile.filter_by_company_skills(profiles, selected_company_skills)
		
		# @company_skills = CompanySkill.order(:name).unique_name
				
		### 1 refactor, DRI
		@company_skills = []
		CompanySkill.all.each do |company_skill|
			@company_skills << company_skill if company_skill.category.id == selected_category["id"]
		end

		respond_to do |format|
	        format.html
	        format.js
	    end
	end

	private

	def company_skills_strong_params
		params.require(:company_skill).permit(:name)
	end
end
