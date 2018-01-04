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
		@filtered_profile = Profile.find(@filtered_profile_id)
		@category = params[:category]
		# @company_skills = CompanySkill.order(:name).unique_name

		if params[:category].upcase == "ALL"
			@company_skills = CompanySkill.order(:name).unique_name
		else
			@company_skills = CompanySkill.where(category: params[:category]).unique_name
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
		
		@profiles = Profile.filter_by_company_skills(sel_company_skills)
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

		@profiles = Profile.filter_by_company_skills(sel_company_skills)

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





