class CategoriesController < ApplicationController
	def create
		@category = Category.create(category_strong_params)
		redirect_to pairs_path
	end

	# services!
	def filter_show
		@profile = Profile.find(params[:profile_id].to_i)
		authorize @profile

		if params[:category].upcase == "ALL"
			company_skills = CompanySkill.all
			@company_skills = policy_scope(company_skills)
		else
			company_skills = CompanySkill.where(category: params[:category])
			@company_skills = policy_scope(company_skills)
		end

		respond_to do |format|
	        format.html
	        format.js 
	    end
	end

	### put this method as a class method in method own_company_skills
	### is it a good idea? someone to check it
	def filter_index_profile_by_category
		@filtered_profile_id = params[:profile_id].to_i
		@filtered_profile = Profile.find(@filtered_profile_id)
		authorize @filtered_profile

		if params[:category].upcase == "ALL"
			@own_company_skills = @filtered_profile.own_company_skills.unique_name
			# own_company_skills = policy_scope(own_company_skills)
		else
			category = Category.find(params[:category].to_i) 
			sel_company_skills = CompanySkill.where(category: category)
			@own_company_skills = @filtered_profile.own_company_skills.where(category: category)
			# @own_company_skills = policy_scope(own_company_skills)
			### why he is not complaing about this commented line? i need it, don't i?
		end

		respond_to do |format|
	        format.html
	        format.js 
	    end
	end

	# index page
	def add_category_session
		sel_category = Category.find(params[:category].to_i)
		session[:category] = sel_category
		sel_company_skills = session[:company_skills]
		
		### dksajöfa
		### buf, it works, but refactor the method filter_by_company_skills,
		### so that it does not return an array, but an AR collection
		### then you can use policy_scope and not these inefficient loop
		@profiles = Profile.filter_by_company_skills(sel_company_skills)
		@profiles.each do |profile|
			authorize profile
		end

		@company_skills = CompanySkill.filter_company_skills_by_category(sel_category)
		### why pundit is not complaing about showing the company_skills?
		### i thought it uses white approach. first nothing works, and you have to
		### give policies to everything to make it work. why here not?

		respond_to do |format|
	        format.html
	        format.js 
	    end
	end

	def remove_category_session
		session[:category] = Category.new
		sel_category = session[:category]
		sel_company_skills = session[:company_skills]
		sel_company_skills_names = sel_company_skills.map { |sel_company_skill| sel_company_skill["name"] }

		if sel_company_skills.empty?
			profiles = Profile.all
		else
			profiles = Profile.includes(:own_company_skills).where(own_company_skills: { name: sel_company_skills_names } )
		end

		@profiles = policy_scope(profiles)
		# raise

		@company_skills = CompanySkill.order(:name).unique_name
		@company_skills.each do |company_skill|
			authorize company_skill
		end
		# raise

		respond_to do |format|
	        format.html { redirect_to profiles_path }
	        format.js { render template: "categories/add_category_session" }
	    end
	end

	private
	def category_strong_params
		params.require(:category).permit(:name)
	end
end





