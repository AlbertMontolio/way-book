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

	def filter_index_all_profiles

		if params[:category].upcase == "ALL"
			@profiles = Profile.all
		else
			category = Category.find(params[:category].to_i)
			@all_profiles = Profile.all
			@filtered_profiles = []

			# refactor with include please
			@all_profiles.each do |profile|
				has_category = false
				profile.own_company_skills.each do |own_company_skill|
					if has_category == false
						if own_company_skill.category == category
							@filtered_profiles << profile
							has_category = true
						end
					end
				end
			end
			@profiles = @filtered_profiles
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
