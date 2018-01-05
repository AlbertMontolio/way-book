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

end
