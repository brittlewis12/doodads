class AppsController < ApplicationController
  # show fun stuff re: apps. hot list, recently updated...
  def index; end

  def search
    if params[:q].nil?
      render :search
    else
      query = params[:q].gsub(" ","+")
      response = HTTParty.get("https://itunes.apple.com/search?term=#{query}&entity=software&limit=10")
      parsed = JSON.parse(response)

      if parsed["resultCount"] == 0
        @results = nil
      else
        @results = []
        parsed["results"].each do |result|
          @results << result
        end
      end

      render :search_results
    end
  end

  def create; end

  def show
    lookup_id = params[:id]
    response = HTTParty.get(itunes_lookup lookup_id)
    parsed = JSON.parse(response)
    @app = App.new
    res = parsed["results"][0]

    @itunes_id = res["trackId"]
    @name = res["trackName"]
    @itunes_url = res["trackViewUrl"]
    @icon_url = res["artworkUrl512"]
    @developer = res["artistName"]
    @developer_url = res["sellerUrl"]
    @price = res["price"]
   
    @description = res["description"]
    @current_rating = res["averageUserRatingForCurrentVersion"]
    @current_rating_count = res["userRatingCountForCurrentVersion"]
    @total_rating = res["averageUserRating"]
    @total_rating_count = res["userRatingCount"]
    
    @category = res["primaryGenreName"]
    @game_center_enabled = res["isGameCenterEnabled"]
    
    @is_universal = res["features"].include?("iosUniversal") if res["features"]

    @app.save!

    @screenshot_urls = res["screenshotUrls"] # enumerate each to screenshots table
    @ipad_screenshot_urls = res["ipadScreenshotUrls"] # enumerate each to screenshots table
  end

  def itunes_lookup itunes_id
    "https://itunes.apple.com/lookup?id=#{itunes_id}"
  end
end