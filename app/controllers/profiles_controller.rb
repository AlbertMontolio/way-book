class ProfilesController < ApplicationController
	def show
		# curriculums
		@curriculums = current_user.profile.curriculums
		@curriculum = Curriculum.new

		# own skills
		@own_skill = OwnSkill.new
		@own_skills = current_user.profile.own_skills

		# own_company_skills
		@own_company_skill = OwnCompanySkill.new
		@own_company_skills = current_user.profile.own_company_skills	
		@own_company_skills_names = @own_company_skills.map { |skill| skill.name }

		# categories
		@categories = Category.all

		
		if params[:category].present?
			if params[:category].upcase == "ALL"
				@company_skills = CompanySkill.all
			else
				@company_skills = CompanySkill.where(category: params[:category])
			end
		else
			@company_skills = CompanySkill.all
		end
		
	end
end
