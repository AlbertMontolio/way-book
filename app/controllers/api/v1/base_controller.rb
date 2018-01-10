# app/controllers/api/v1/base_controller.rb
class Api::V1::BaseController < ActionController::Base
    #it's defined in modules.we need to follow the folders
  include Pundit # We want to use pundit to protect

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  # this two methods check that we used pundit

  # this is for classical error
  # you dont want to send the 500 page, its html. we want to send json
  rescue_from StandardError,                with: :internal_server_error
  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def user_not_authorized(exception)
    render json: { # we render json in case of errors
      error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
    }, status: :unauthorized
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, error: exception.message }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end
end