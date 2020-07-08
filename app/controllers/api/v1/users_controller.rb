class Api::V1::UsersController < ApplicationController

  def create
    user = User.new user_params
    if user.save
      render({json: { id: user.id} })
    else 
      render( { json: { message: 'unable to create user', status: 422, error: user.errors.messages } }, 422)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
