class OwnCompanySkillsController < ApplicationController

	def create
		@company_skill_id = params["company_skill_id"].to_i
		@company_skill = CompanySkill.find(@company_skill_id)
		
		@own_company_skill = OwnCompanySkill.new(name: @company_skill.name)
		
		@own_company_skill.profile = current_user.profile
		@own_company_skill.category = @company_skill.category

		@own_company_skill.save

		respond_to do |format|
	        format.html { redirect_to profile_path(current_user.profile) }
	        format.js
	    end

	end

	def destroy
		@company_skill_id = params[:id].to_i
		@company_skill = CompanySkill.find(@company_skill_id)

		@own_company_skill = current_user.profile.own_company_skills.where(name: @company_skill.name).where(category: @company_skill.category)[0]

		@own_company_skill.delete

		respond_to do |format|
	        format.html { redirect_to profile_path(current_user.profile) }
	        format.js
	    end
	end

	

end
