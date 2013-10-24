class SplashController < ApplicationController
  def index
    if logged_in?
      redirect_to apps_path
    end
  end
end