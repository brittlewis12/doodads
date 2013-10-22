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

  def create
    lookup_id = params[:lookup_id]
    response = HTTParty.get itunes_lookup(lookup_id)
    parsed = JSON.parse response
    res = parsed["results"][0]

    @app = App.new
    @app.itunes_id = res["trackId"]
    @app.name = res["trackName"]
    @app.itunes_url = res["trackViewUrl"]
    @app.icon_url = res["artworkUrl512"]
    @app.developer = res["artistName"]
    @app.developer_url = res["sellerUrl"]
    @app.price = res["price"]
    @app.description = res["description"]
    @app.current_rating = res["averageUserRatingForCurrentVersion"]
    @app.current_rating_count = res["userRatingCountForCurrentVersion"]
    @app.total_rating = res["averageUserRating"]
    @app.total_rating_count = res["userRatingCount"]
    @app.category = res["primaryGenreName"]
    @app.game_center_enabled = res["isGameCenterEnabled"]
    @app.is_universal = res["features"].include?("iosUniversal") if res["features"]

    if @app.save
    else
    end

    @screenshot_urls = res["screenshotUrls"] # enumerate each to screenshots table
    @ipad_screenshot_urls = res["ipadScreenshotUrls"] # enumerate each to screenshots table
  end

  def show;  end

  def itunes_lookup itunes_id
    "https://itunes.apple.com/lookup?id=#{itunes_id}"
  end
end