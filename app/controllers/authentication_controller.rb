# frozen_string_literal: true

# authentication controller
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: %i[authenticate login]

  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    # json_response(auth_token: auth_token)
    session[:auth_token] = auth_token
    redirect_to movie_index_url
  end

  def login; end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
