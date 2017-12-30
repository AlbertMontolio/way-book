class OwnCompanySkillsController < ApplicationController

	def create
		@profile = Profile.find(params[:profile_id].to_i)
		@company_skill_id = params[:company_skill_id].to_i
		@company_skill = CompanySkill.find(@company_skill_id)

		
		CompanySkill.where(name: @company_skill.name).each_with_index do |company_skill, index|
			@own_company_skill = OwnCompanySkill.new(name: @company_skill.name)
			@own_company_skill.profile = @profile
			@own_company_skill.category = company_skill.category
			@own_company_skill.save
		end

		respond_to do |format|
	        format.html { redirect_to profile_path(@profile) }
	        format.js
	    end

	end

	def destroy
		@profile = Profile.find(params[:profile_id].to_i)
		@company_skill_id = params[:id].to_i
		@company_skill = CompanySkill.find(@company_skill_id)
		
		@profile.own_company_skills.where(name: @company_skill.name).each do |own_company_skill|
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
