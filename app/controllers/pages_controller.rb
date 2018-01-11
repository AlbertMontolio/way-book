class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  	puts "----1111111-------------------------------"
  	puts "current_user.email"
  	puts current_user.email
  	puts "-------22222-----------------------------"
  	puts "current_user.profile"
  	puts current_user.profile
  	puts "-------3333-----------------------------"
  	puts "current_user.profile.first_name"
  	puts current_user.profile.first_name
  	puts "----------4444--------------------------"
  end
end
