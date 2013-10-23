class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate
      user.log_in!
      redirect_to user_path(user)
    else
      redirect_to new_session_path
    end
  end

  def destroy
  end

end