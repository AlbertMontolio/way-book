class ProfilesController < ApplicationController
	
	def index
		@is_profiles_page = true
		# initialize session hashes
		session[:company_skills] = [] if session[:company_skills].nil?
		session[:category] = Category.new if session[:category].nil?

		# filtering profiles by selected company skills
		sel_company_skills = session[:company_skills]
		sel_company_skills_names = sel_company_skills.map { |sel_company_skill| sel_company_skill["name"] }

		if sel_company_skills.empty?
			@profiles = Profile.all
		else
			@profiles = Profile.includes(:own_company_skills).where(own_company_skills: { name: sel_company_skills_names } )
		end

		# filtering company skills by selected category
		sel_category = session[:category]
		if session[:category]["id"] == nil
			@company_skills = CompanySkill.order(:name).unique_name
		else
			@company_skills = CompanySkill.includes(:category).where(categories: { name: sel_category["name"] })
		end

		@categories = Category.all
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
