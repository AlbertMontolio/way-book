class Api::V1::UsersController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User

    def index
     # @users = policy_scope(User)
      @users = User.all
    end
end