class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  	puts "-----------------------------------"
  	puts "PagesController home"
  	puts "-----------------------------------"
  	if user_signed_in?
  		puts "current_user"
  		puts current_user

  		puts "current_user.profile"
  		puts current_user.profile

  		puts "current_user.profile.first_name"
  		puts current_user.profile.first_name
  	end
  end
end
