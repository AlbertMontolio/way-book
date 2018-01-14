class Api::V1::UsersController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User

    def index
     # @users = policy_scope(User)
      @users = policy_scope(User)
    end

    def create
    	if request.format.json?
    		email = params["email"]
    		password = params["password"]
    		@user = User.new(email: email, password: password)
    		authorize @user
    		if @user.save
    			render :show
    		else
    			render_error
    		end
    	end
    end

    def render_error
        render json: { errors: @user.errors.full_messages },
          status: :unprocessable_entity
    end
end
