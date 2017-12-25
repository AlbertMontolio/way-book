class CompanySkillsController < ApplicationController

	def index
		@company_skills = CompanySkill.all
		@company_skill = CompanySkill.new
	end

	def create
		@company_skill = CompanySkill.create(company_skills_strong_params)
		redirect_to company_skills_path
	end

	private
	def company_skills_strong_params
		params.require(:company_skill).permit(:name)
	end
end
