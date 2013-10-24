class UsersController < ApplicationController
  
  before_action :authenticated!, :get_user, :authorized!, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in!(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    get_user # && current_user.doodads
  end

  def edit
    # change email address, password, unfollow apps, etc
  end

  def update
    # receives changes from users#edit, and commits them to the db
  end

  def destroy
    # deletes a user account.
    # reminder -- that fancy confirm js option!
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

  def get_user
    @user = User.find params[:id]
  end

  def authorized!
    unless @user.id == session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end

end