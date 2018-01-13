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

	### where to put this search? class method, and then call it in the own_company_skills?
	### is bad pactice to group all the search functions in the search controller?
	def search_skills
		sel_company_skill_name = params[:skills]

		sel_company_skill = CompanySkill.where('lower(name) = ?', sel_company_skill_name.downcase).first

		if sel_company_skill.nil? or params[:skills] == ""
			sel_company_skill = CompanySkill.new
			session[:category] = Category.new
			session[:company_skills] = []
		else
			sel_category = Category.where(name: sel_company_skill.category.name)[0]
			session[:category] = sel_category

			session[:company_skills] = []
			session[:company_skills] << sel_company_skill
		end

		authorize sel_company_skill

		redirect_to own_company_skills_path
	end

	def search_by_division
		profiles = Profile.where(division: params[:division])
		@profiles = policy_scope(profiles)
		redirect_to profiles_path
	end

	def search_by_team
		@profiles = Profile.where(team: params[:team])
	end

end










