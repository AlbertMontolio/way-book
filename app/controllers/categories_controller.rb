class CategoriesController < ApplicationController
	def create
		@category = Category.create(category_strong_params)
		redirect_to pairs_path
	end

	private
	def category_strong_params
		params.require(:category).permit(:name)
	end
end
