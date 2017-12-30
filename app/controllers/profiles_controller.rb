class ProfilesController < ApplicationController
	
	def index
		@profiles = Profile.all
		@categories = Category.all
		@company_skills = CompanySkill.order(:name).unique_name
		# raise

		# @own_company_skills = current_user.profile.own_company_skills
	end

	def show
		@profile = Profile.find(params[:id].to_i)
		session[:company_skills] = []
		
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
