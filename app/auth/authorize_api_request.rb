# frozen_string_literal: true

# Authorize requests
class AuthorizeApiRequest
  def initialize(session_token, headers = {})
    @headers = headers
    @session_token = session_token
  end

  # Service entry point - return valid user object
  def call
    {
      user:
    }
  end

  private

  attr_reader :headers, :session_token

  def user
    # check if user is in the database
    # memoize user object
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    # handle user not found
  rescue ActiveRecord::RecordNotFound => e
    # raise custom error
    raise(
      ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{e.message}")
    )
  end

  # decode authentication token
  def decoded_auth_token
    return @decoded_auth_token ||= JsonWebToken.decode(session_token) unless session_token.nil?

    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # check for token in `Authorization` header
  def http_auth_header
    return headers['Authorization'].split.last if headers['Authorization'].present?

    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end
