class CompanySkillsController < ApplicationController

	def index

		@categories = Category.all
		@category = Category.new

		@company_skills = CompanySkill.all
		@company_skill = CompanySkill.new
	end

	def create
		raise
		@company_skill = CompanySkill.create(company_skills_strong_params)
		redirect_to company_skills_path
	end

	private
	def company_skills_strong_params
		params.require(:company_skill).permit(:name)
	end
end
