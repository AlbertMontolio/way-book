class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  	puts "-----------------------------------"
  	puts current_user
  	puts current_user.profile
  	puts current_user.profile.first_name
  end
end
