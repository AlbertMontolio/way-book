class SearchsController < ApplicationController
	### refactor
	### get rid of so many ifs, and use methods instead
	### chained methods?
	### are there better alternatives?
	def search_employee

		if params[:name].nil?
			@profiles = [Profile.new]
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

		session[:category] = Category.new
		sel_company_skill_name = params[:skills]
		sel_company_skill = CompanySkill.where(name: sel_company_skill_name)[0]

		session[:company_skills] = []
		session[:company_skills] << sel_company_skill


		# @profiles = []
		# Profile.all.each do |profile|
		# 	profile.own_company_skills.each do |own_company_skill|
		# 		if own_company_skill.name == sel_company_skill
		# 			@profiles << profile
		# 		end
		# 	end
		# end

		redirect_to profiles_path
	end

end










