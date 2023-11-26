# frozen_string_literal: true

# User controller
class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def new
    @user = User.new
  end

  def create
    begin
      @user = User.create!(user_params)
    rescue RecordInvalid
      json_response({ message: Message.account_not_created }, :internal_server_error)
    end
    AuthenticateUser.new(@user.email, @user.password).call
    # response = { message: Message.account_created, auth_token: }
    # json_response(response, :created)
    render :success
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :active)
  end
end
