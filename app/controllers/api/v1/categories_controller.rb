class Api::V1::CategoriesController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User

    def update
    	id = params["id"].to_i
        name = params["name"]
    	@category = Category.find(id)

    	if @category
    		@category.update(strong_category_params)
    		render :no_content
	    else
	    	render :no_content
	    end
    	
    end

    def destroy
        id = params["id"].to_i
        category = Category.find(id)
        category.destroy
        render :no_content
    end

    def create
        division_id = params["category"]["division_id"]
        division = Division.find(division_id)

        category = Category.new(strong_category_params)
        category.division = division
        category.save
        render :no_content
    end

    private

    def strong_category_params
    	params.require(:category).permit(:name)
    end
end