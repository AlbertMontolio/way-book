class Api::V1::ProfilesController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User
    # protect_from_forgery with: :null_session
    # protect_from_forgery prepend: true
    # skip_before_action :verify_authenticity_token

    ### i don't need any of them

    def index
      @profiles = policy_scope(Profile)
    end
end