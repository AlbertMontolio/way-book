class CurriculumsController < ApplicationController

	def create
		@curriculum = Curriculum.new(curriculum_strong_params)
		@curriculum.profile = current_user.profile

		authorize @curriculum
		@curriculum.save
		redirect_to profile_path(current_user.profile)
	end

	def curriculum_strong_params
		params.require(:curriculum).permit(:title, :description, :document)
	end
end
