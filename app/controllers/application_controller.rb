# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  before_action :authorize_request
  caches_page :index
  attr_reader :current_user

  private

  def authorize_request
    @current_user = AuthorizeApiRequest.new(session[:auth_token], request.headers).call[:user]
  end
end
