class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception ### uncommment it
    # before_action :sample_test # before any controller
  	before_action :authenticate_user!
    # after_filter :cors_set_access_control_headers, :cors_preflight_check
    # before_filter :cors_set_access_control_headers

    # def cors_set_access_control_headers
    #   headers['Access-Control-Allow-Origin'] = 'http://localhost:3001'
    #   headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    #   headers['Access-Control-Request-Method'] = '*'
    #   headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    # end

    # def cors_preflight_check
    #   if request.method == :options
    #     headers['Access-Control-Allow-Origin'] = 'http://localhost:3001'
    #     headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    #     headers['Access-Control-Request-Method'] = '*'
    #     headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    #     render :text => '', :content_type => 'application/json'
    #   end
    # end

    # def sample_test
    #     binding.pry
    # end

  	include Pundit

    # Pundit: white-list approach.
    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
    ### after each action we verify that pundit was used
    ### except when we use devise or when you are rails admin page admin
    ### you do that with rails admin

    # Uncomment when you *really understand* Pundit!
    # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    # def user_not_authorized
    #   flash[:alert] = "You are not authorized to perform this action."
    #   redirect_to(root_path)
    # end

    private

    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end
end
