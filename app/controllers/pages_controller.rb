class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  	puts "-----------------------------------"
  	puts "PagesController home"
  	puts "-----------------------------------"
  	if user_signed_in?
  		puts "i am sign in"
  		puts "current_user.id"
  		puts current_user.id
  		puts "---------------------------------"

  		puts "current_user.email"
  		puts current_user.email
  		puts "---------------------------------"

  		puts "current_user.password"
  		puts current_user.password
  		puts "----------------------------------"

  		puts "current_user.profile"
  		puts current_user.profile
  		puts "-------------------------------------"

  		puts "current_user.profile.id"
  		puts current_user.profile.id
  		puts "-------------------------------------"

  		puts "current_user.profile.division"
  		puts current_user.profile.division
  		puts "-------------------------------------"

  		puts "current_user.profile.first_name"
  		puts current_user.profile.first_name
  	end
  end
end
