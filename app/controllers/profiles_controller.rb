class ProfilesController < ApplicationController
	
	def index
		@is_search_employee_page = true
		
		if params[:division]
			profiles = Profile.where(division: params[:division])
			@profiles = policy_scope(profiles)
		elsif params[:team]
			profiles = Profile.where(team: params[:team])
			@profiles = policy_scope(profiles)
		elsif params[:name] and params[:name] != ""
			employee = params[:name]
			profiles = Profile.search(employee)
			@profiles = policy_scope(profiles)
			redirect_to profile_path(@profiles.first) if Profile.is_profile_found?(employee)
		else
			profiles = Profile.all
			@profiles = policy_scope(profiles)
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
		puts "params--------------------------------------------------"
		puts params
		puts params[:id]
		puts params["id"]
		@profile = Profile.find(params["id"].to_i)
		authorize @profile

		# curriculums
		@curriculums = current_user.profile.curriculums
		@curriculums =policy_scope(@curriculums)

		@curriculum = Curriculum.new
		authorize @curriculum, :new?

		# own skills
		@own_skills = current_user.profile.own_skills

		# own company skills

		# categories
		@categories = Category.all

		# company skills
		@company_skills = CompanySkill.order(:name).unique_name

		# projects
		@projects = current_user.profile.projects
		@project = Project.new
		authorize @project, :new?

		respond_to do |format|
	        format.html
	        format.js
	    end
	end
end
