class CategoriesController < ApplicationController
	def create
		@category = Category.create(category_strong_params)
		redirect_to pairs_path
	end

	# services!
	def filter_show
		@profile = Profile.find(params[:profile_id].to_i)
		if params[:category].upcase == "ALL"
			@company_skills = CompanySkill.all
		else
			@company_skills = CompanySkill.where(category: params[:category])
		end

		respond_to do |format|
	        format.html
	        format.js 
	    end
	end

	def filter_index_profile_by_category
		@filtered_profile_id = params[:profile_id].to_i
		@filtered_profile = Profile.find(@filtered_profile_id)
		category = Category.find(params[:category].to_i)
		# @category = params[:category].to_i
		# @company_skills = CompanySkill.order(:name).unique_name

		if params[:category].upcase == "ALL"
			@own_company_skills = @filtered_profile.own_company_skills.unique_name
		else
			sel_company_skills = CompanySkill.where(category: category)
			raise
			# @filtered_profile.own_company_skills.last == category
			@own_company_skills = @filtered_profile.own_company_skills.where(category: category)
		end
		raise

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
		
		puts "sel_company_skills"
		puts sel_company_skills
		# if session[:category].nil?
		# 	@profiles = Profile.all
		# else
		@profiles = Profile.filter_by_company_skills(sel_company_skills)
		# end
		@company_skills = CompanySkill.filter_company_skills_by_category(sel_category)

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

		@profiles = Profile.includes(:own_company_skills).where(own_company_skills: { name: sel_company_skills_names } )
		raise

		# @profiles = Profile.filter_by_company_skills(sel_company_skills)

		@company_skills = CompanySkill.order(:name).unique_name

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





