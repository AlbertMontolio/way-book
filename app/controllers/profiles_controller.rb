class ProfilesController < ApplicationController
	
	def index
		profiles = Profile.all
		sel_company_skills = session[:company_skills]
		sel_category = session[:category]

		profiles = Profile.filter_by_category(profiles, sel_category)
		@profiles = Profile.filter_by_company_skills(profiles, sel_company_skills)
		
		@categories = Category.all

		if session[:category]["id"] != nil and session[:company_skills].length == 0
			@company_skills = CompanySkill.filter_company_skills_by_category(sel_category).unique_name
		else
			@company_skills = CompanySkill.order(:name).unique_name
		end

		@all_company_skills = CompanySkill.order(:name).unique_name
	end

	def show
		@profile = Profile.find(params[:id].to_i)
		session[:company_skills] = []
		session[:category] = Category.new
		
		# curriculums
		@curriculums = current_user.profile.curriculums
		@curriculum = Curriculum.new

		# own skills
		@own_skill = OwnSkill.new
		@own_skills = current_user.profile.own_skills

		# own company skills
		@own_company_skill = OwnCompanySkill.new

		# categories
		@categories = Category.all

		# company skills
		@company_skills = CompanySkill.order(:name).unique_name

		# projects
		@project = Project.new
		@projects = current_user.profile.projects

		respond_to do |format|
	        format.html
	        format.js
	    end
		
	end
end
