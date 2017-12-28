class ProjectsController < ApplicationController
	def create
		@project = Project.new(projects_strong_params)
		@project.profile = current_user.profile
		@project.save

		# @projects = current_user.profile.projects

		respond_to do |format|
	        format.html { redirect_to profile_path(current_user.profile) }
	        format.js
	    end
		
	end

	private

	def projects_strong_params
		params.require(:project).permit(:title, :client, :start, :finish)
	end
end
