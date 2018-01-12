class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  	puts "----1111111-------------------------------"
  	puts "current_user.email"
  	# puts current_user.email

  end
end
