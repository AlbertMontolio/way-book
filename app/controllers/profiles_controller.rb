class ProfilesController < ApplicationController
	
	def index
		@profiles = Profile.all
		@categories = Category.all
		@company_skills = CompanySkill.all
		# raise

		# @own_company_skills = current_user.profile.own_company_skills
	end

	def show
		session[:company_skills] = []
		# curriculums

		@curriculums = current_user.profile.curriculums
		@curriculum = Curriculum.new

		# own skills
		@own_skill = OwnSkill.new
		@own_skills = current_user.profile.own_skills

		# own_company_skills
		@own_company_skill = OwnCompanySkill.new

		# categories
		@categories = Category.all

		@company_skills = CompanySkill.all

		# projects
		@project = Project.new
		@projects = current_user.profile.projects

		respond_to do |format|
	        format.html
	        format.js
	    end
		
	end
end
