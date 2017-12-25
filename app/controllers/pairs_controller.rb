class PairsController < ApplicationController

	def index
		@company_skills = CompanySkill.all
		@company_skill = CompanySkill.new
		@pair = Pair.new
		@pairs = Pair.all

		@category = Category.new
		@categories = Category.all
	end

	def create
		company_skill_name = params[:pair][:company_skill]
		company_skill = CompanySkill.create(name: company_skill_name)

		category_id = params[:pair][:category].to_i
		category = Category.find(category_id)

		Pair.create(company_skill: company_skill, category: category)

		redirect_to pairs_path
	end

	private
	### do i need it?
	def company_skills_strong_params
		# params.require(:company_skill).permit(:name)
	end
end
