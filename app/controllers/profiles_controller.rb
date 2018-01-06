class ProfilesController < ApplicationController
	
	def index
		session[:company_skills] = [] if session[:company_skills].nil?
		session[:category] = Category.new if session[:category].nil?

		# raise
		profiles = Profile.all
		sel_company_skills = session[:company_skills]
		sel_category = session[:category]

		if sel_category.nil?
			@profiles = Profile.all
		else
			@profiles = Profile.filter_by_company_skills(sel_company_skills) 
		end
		
		@categories = Category.all

		if session[:category].nil? or session[:category]["id"] != nil
			@company_skills = CompanySkill.order(:name).unique_name
		else
			@company_skills = CompanySkill.filter_company_skills_by_category(sel_category)
		end

		@all_company_skills = CompanySkill.order(:name).unique_name
	end

	def edit
		@profile = Profile.find(params[:id].to_i)
		# session[:company_skills] = []
		# session[:category] = Category.new
		
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

	def show
			@profile = Profile.find(params[:id].to_i)
			
			# curriculums
			@curriculums = current_user.profile.curriculums

			# own skills
			@own_skills = current_user.profile.own_skills

			# own company skills

			# categories
			@categories = Category.all

			# company skills
			@company_skills = CompanySkill.order(:name).unique_name

			# projects
			@projects = current_user.profile.projects

			respond_to do |format|
		        format.html
		        format.js
		    end
	end
end
