class DoodadsController < ApplicationController

  before_action :current_user, only: [:create]

  def index
    @app = App.find(params[:id])
  end

  def new
    @app = App.find(params[:id])
    @doodad = Doodad.new
  end

  def create
    @doodad = Doodad.new(doodad_params)
    @doodad.user_id = @current_user.id
    @app = App.find(params[:id])
    @doodad.app_id = @app.id

    if @doodad.save
      redirect_to doodads_path
    else
      @app = App.find(params[:id])
      render new_doodad_path(@app)
    end
  end

  # allow users to vote eventually
  # def show; end

  private

  def doodad_params
    params.require(:doodad).permit(:title, :description)
  end

end

# WhatsApp is one of my favorite messaging apps. It is quick, easy to set up, everyone who has a phone can use it. But it is a really ugly, and it looks especially out of place now that Apple has their now iPhone software out. I'd love it if WhatsApp could be updated to support iOS 7!