class OwnCompanySkillsController < ApplicationController

	def create
		# @profile = Profile.find(params[:profile_id].to_i)
		@profile = current_user.profile
		@company_skill_id = params[:company_skill_id].to_i
		@company_skill = CompanySkill.find(@company_skill_id)
		rating = params[:rating].to_i

		CompanySkill.where(name: @company_skill.name).each_with_index do |company_skill, index|
			@own_company_skill = OwnCompanySkill.new(name: @company_skill.name)
			authorize @own_company_skill
			
			@own_company_skill.profile = @profile
			@own_company_skill.category = company_skill.category
			@own_company_skill.rating = rating

			authorize @own_company_skill
			@own_company_skill.save
		end

		respond_to do |format|
	        format.html { redirect_to profile_path(@profile) }
	        format.js
	    end
	end

	def index
		@is_profiles_page = true
		# initialize session hashes
		session[:company_skills] = [] if session[:company_skills].nil?
		session[:category] = Category.new if session[:category].nil?

		# filtering profiles by selected company skills
		sel_company_skills = session[:company_skills]
		sel_company_skills_names = sel_company_skills.map { |sel_company_skill| sel_company_skill["name"] }

		if sel_company_skills.empty?
			profiles = Profile.all
			@profiles = policy_scope(profiles)
		else
			profiles = Profile.includes(:own_company_skills).where(own_company_skills: { name: sel_company_skills_names } )
			@profiles = policy_scope(profiles)
		end

		# filtering company skills by selected category
		sel_category = session[:category]
		if session[:category]["id"] == nil
			@company_skills = CompanySkill.order(:name).unique_name
		else
			@company_skills = CompanySkill.includes(:category).where(categories: { name: sel_category["name"] })
		end

		@categories = Category.all
		# binding.pry
	end

	def edit
		raise
	end

	def update
		@company_skill_id = params[:company_skill_id].to_i
		@company_skill = CompanySkill.find(@company_skill_id)

		# @profile = Profile.find(params[:profile_id].to_i)
		@profile = current_user.profile
		rating = params[:rating].to_i
		own_company_skill = OwnCompanySkill.find(params[:id].to_i)

		if own_company_skill.rating == rating
			new_rating = rating - 1
		else
			new_rating = rating
		end

		authorize own_company_skill
		own_company_skill.update(rating: new_rating)

		respond_to do |format|
	        format.html { redirect_to profile_path(@profile) }
	        format.js
	    end	
	end



	def destroy
		# @profile = Profile.find(params[:profile_id].to_i)
		@profile = current_user.profile
		@company_skill_id = params[:id].to_i
		@company_skill = CompanySkill.find(@company_skill_id)
		
		@profile.own_company_skills.where(name: @company_skill.name).each do |own_company_skill|
			authorize own_company_skill
			own_company_skill.delete
		end

		# own_company_skills for the view
		@own_company_skills = @profile.own_company_skills
		@own_company_skills_names = @own_company_skills.map { |skill| skill.name }

		respond_to do |format|
	        format.html { redirect_to profile_path(@profile) }
	        format.js
	    end
	end



end
