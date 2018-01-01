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

	def filter_profile_by_category

		@filtered_profile_id = params[:profile_id].to_i

		if params[:category].upcase == "ALL"
			@own_company_skills = Profile.find(@filtered_profile_id).own_company_skills
		else
			@own_company_skills = Profile.find(@filtered_profile_id).own_company_skills.where(category: params[:category])
		end

		respond_to do |format|
	        format.html
	        format.js 
	    end
	end

	# index page
	def filter_index_all_profiles
		category = Category.find(params[:category].to_i)
		session[:category] = category
		selected_category = category
		selected_company_skills = session[:company_skills]

		profiles = Profile.all
		profiles = Profile.filter_by_category(profiles, selected_category)
		@profiles = Profile.filter_by_company_skills(profiles, selected_company_skills)

		### 1 refactor, DRI
		@company_skills = []
		CompanySkill.all.each do |company_skill|
			@company_skills << company_skill if company_skill.category.id == category["id"]
		end

		respond_to do |format|
	        format.html
	        format.js 
	    end
	end

	def remove_category_session
		@profiles = Profile.all
		@company_skills = CompanySkill.order(:name).unique_name
		
		session[:category] = Category.new
		respond_to do |format|
	        format.html { redirect_to profiles_path }
	        format.js { render template: "categories/filter_index_all_profiles" }
	    end
	end

	private
	def category_strong_params
		params.require(:category).permit(:name)
	end
end





