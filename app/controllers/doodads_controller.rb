class DoodadsController < ApplicationController

  def index
    @app = App.find(params[:id])
  end

  def new
    @doodad = Doodad.new
  end

  def create; end

  # allow users to vote eventually
  def show; end

end