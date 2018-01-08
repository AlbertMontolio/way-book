class SearchsController < ApplicationController
	### refactor
	### get rid of so many ifs, and use methods instead
	### chained methods?
	### are there better alternatives?
	def search_employee
		@is_search_employee_page = true
		if params[:name].nil? or params[:name] == ""
			@profiles = []
		else
			name = params[:name]

			splitted_name = name.split(" ")

			if splitted_name.length == 1
				name = splitted_name[0]
				first_names = Profile.where("first_name like ?", "%" + name + "%")
				last_names = Profile.where("last_name like ?", "%" + name + "%")
				if last_names.empty?
					@profiles = first_names
				else
					@profiles = last_names
				end				
			else
				first_name = name.split(" ")[0]
				last_name = name.split(" ")[1]

				@profiles = Profile.where("first_name like ?", "%" + first_name + "%").where("last_name like ?", "%" + last_name + "%")

				if @profiles.length == 0
					@profiles = Profile.where("first_name like ?", "%" + first_name + "%")
					if @profiles.length == 0
						@profiles = Profile.where("last_name like ?", "%" + last_name + "%")
					end
				else
					redirect_to profile_path(@profiles[0])
				end
			end
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










