class ProfilesController < ApplicationController
	def show
		@curriculums = current_user.profile.curriculums
		@curriculum = Curriculum.new
	end
end
