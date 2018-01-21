class Api::V1::UsersController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User

    def index
      @users = policy_scope(User).order(:email)
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

    def update_admin
        user_id = params["id"].to_i
        user = User.find(user_id)
        ### do it with strong user params also
        user.update(admin: !user.admin)
        render :show
    end

    def update
        user_id = params["id"].to_i
        user = User.find(user_id)
        user.update(strong_user_params)
        render :show
    end

    def destroy
        user_id = params["id"].to_i
        user = User.find(user_id)
        user.profile
        user.destroy
        render :show
    end

    private

    def strong_user_params
        params.require(:user).permit(:email, :admin)
    end

    def render_error
        render json: { errors: @user.errors.full_messages },
          status: :unprocessable_entity
    end
end
