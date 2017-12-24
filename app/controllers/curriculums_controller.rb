class CurriculumsController < ApplicationController

	def index
		
		@curriculums = Curriculum.all
	end

	def show
		@curriculum = Curriculum.new
		@curriculums = current_user.profile.curriculums
	end

	def create
		@curriculum = Curriculum.new(curriculum_strong_params)
		@curriculum.profile = current_user.profile
		@curriculum.save
		redirect_to curriculum_path(@curriculum)
	end

	def curriculum_strong_params
		params.require(:curriculum).permit(:title, :description, :document)
	end
end
