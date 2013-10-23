class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path @user
    else
      render :new
    end
  end

  def show
    @user = get_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

  def get_user
    User.find(params[:id])
  end

  def logged_in?
  end

  def authenticated!
  end

  def set_user
  end

  def authorized!
  end

end