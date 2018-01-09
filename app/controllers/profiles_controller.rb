class ProfilesController < ApplicationController
	
	def index
		@is_search_employee_page = true
		employee = params[:name]

		if employee.nil?
			@profiles = []
		else
			@profiles = Profile.search(employee)
			redirect_to profile_path(@profiles.first) if Profile.is_profile_found?(employee)
		end
	end

	def edit
		@profile = Profile.find(params[:id].to_i)
		
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
