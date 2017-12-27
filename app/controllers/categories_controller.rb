class CategoriesController < ApplicationController
	def create
		@category = Category.create(category_strong_params)
		redirect_to pairs_path
	end

	def filter_show
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

	def filter_index

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

	private
	def category_strong_params
		params.require(:category).permit(:name)
	end
end
