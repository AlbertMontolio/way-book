class Api::V1::DivisionsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User

    def index
      @divisions = policy_scope(Division)
    end

    def create
		json_division = params["division"]
		division = JSON.parse(json_division)
		@division = Division.new(name: division["name"])
		authorize @division
		@division.save
		render :show		
    end

    def destroy
    	id = params["id"].to_i
    	@division = Division.find(id)

    	if @division
    		@division.destroy
    		render :no_content
	    else
	    	render :no_content
	    end
    end

    def update
    	id = params["division"]["id"].to_i
        name = params["division"]["name"]
    	@division = Division.find(id)

    	if @division
    		@division.update(strong_division_params)
    		render :no_content
	    else
	    	render :no_content
	    end
    	
    end

    private

    def strong_division_params
    	params.require(:division).permit(:name)
    end
end