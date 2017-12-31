class ProfilesController < ApplicationController
	
	def index
		profiles = Profile.all
		selected_company_skills = session[:company_skills]
		selected_category = session[:category]

		profiles = Profile.filter_by_category(profiles, selected_category)
		@profiles = Profile.filter_by_company_skills(profiles, selected_company_skills)
		# raise
		@categories = Category.all
		@company_skills = CompanySkill.order(:name).unique_name
		
		# @own_company_skills = current_user.profile.own_company_skills
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
