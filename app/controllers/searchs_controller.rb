class SearchsController < ApplicationController
	
	def search_employee
		@is_search_employee_page = true
		employee = params[:name]

		if employee.empty? or employe.nil?
			@profiles = []
		else
			@profiles = Profile.search(employee)
			redirect_to profile_path(@profiles.first) if Profile.is_profile_found?(employee)
		end
	end

	def search_skills
		sel_company_skill_name = params[:skills]
		sel_company_skill = CompanySkill.where(name: sel_company_skill_name)[0]

		sel_category = Category.where(name: sel_company_skill.category.name)[0]
		session[:category] = sel_category

		session[:company_skills] = []
		session[:company_skills] << sel_company_skill

		redirect_to profiles_path
	end

	def search_by_division
		@profiles = Profile.where(division: params[:division])
	end

	def search_by_team
		@profiles = Profile.where(team: params[:team])
	end

end










