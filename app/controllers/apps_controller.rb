class AppsController < ApplicationController

  # show fun stuff re: apps. hot list, recently updated...
  def index; end

  def search
    query = params[:query].gsub(" ","+")
    response = HTTParty.get("https://itunes.apple.com/search?term=#{query}&entity=software&limit=10")

    if response["resultCount"] == 0
      @results = nil
    else
      @results = []
      response["results"].each do |result|
        @results << result
      end
    end

    render :search  
  end

  def create; end

  def show; end

end