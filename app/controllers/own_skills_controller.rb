class OwnSkillsController < ApplicationController

	def create
		@own_skill = OwnSkill.new(own_skill_strong_params)
		@own_skill.profile = current_user.profile
		@own_skill.save

		profile = current_user.profile
		respond_to do |format|
	        format.html { redirect_to profile_path(profile) }
	        format.js  # <-- idem
	    end
		
	end

	def destroy
		@own_skill = OwnSkill.find(params[:id].to_i)

		@own_skill.delete

		redirect_to profile_path(current_user.profile)
	end

	private

	def own_skill_strong_params
		params.require(:own_skill).permit(:name)
	end
end
