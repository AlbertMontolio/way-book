class OwnCompanySkillsController < ApplicationController

	def create
		@company_skill = CompanySkill.find(params["company_skill"].to_i)
		
		@own_company_skill = OwnCompanySkill.new(name: @company_skill.name)
		
		@own_company_skill.profile = current_user.profile
		@own_company_skill.save

		respond_to do |format|
	        format.html { redirect_to profile_path(current_user.profile) }
	        format.js  # <-- idem
	    end

		# redirect_to profile_path(current_user.profile)
	end

	def destroy
		@own_company_skill = OwnCompanySkill.find(params[:id].to_i)

		@own_company_skill.delete

		redirect_to profile_path(current_user.profile)
	end


end
