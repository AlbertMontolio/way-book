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

	def add_company_skill_session
		@sel_company_skill = CompanySkill.find(params[:company_skill_id].to_i)
		
		session[:company_skills] << @sel_company_skill
		@sel_company_skills = session[:company_skills].uniq
		sel_category = session[:category]
		
		@profiles = Profile.filter_by_company_skills(@sel_company_skills)
		if sel_category["id"].nil?
			@company_skills = CompanySkill.order(:name).unique_name
		else
			@company_skills = CompanySkill.filter_company_skills_by_category(sel_category)
		end
		
		respond_to do |format|
	        format.html
	        format.js
	    end
	end

	def remove_company_skill_session
		@sel_company_skill = CompanySkill.find(params[:company_skill_id].to_i)
		### refactor
		session[:company_skills].each_with_index do |company_skill, index|
			if company_skill["name"] == @sel_company_skill.name
				session[:company_skills].delete_at(index)
			end
		end
		
		sel_category = session[:category]
		@sel_company_skills = session[:company_skills]

		if @sel_company_skills.length == 0
			@profiles = Profile.all
		else
			@profiles = Profile.filter_by_company_skills(@sel_company_skills)
		end


		if session[:company_skills].length == 0
			@company_skills = CompanySkill.order(:name).unique_name
		else
			@company_skills = CompanySkill.filter_company_skills_by_category(sel_category)
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
