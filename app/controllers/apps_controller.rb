class AppsController < ApplicationController
  # show fun stuff re: apps. hot list, recently updated...
  def index; end

  def search
    if params[:q].nil?
      render :search
    else
      query = params[:q]
      response = HTTParty.get itunes_search(query)
      parsed = JSON.parse response

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
    if find_app(lookup_id).nil?
      response = HTTParty.get itunes_lookup(lookup_id)
      parsed = JSON.parse response
      # res = parsed["results"][0]
      fetched = FetchedApp.new(parsed)
      @app = App.new(fetched.to_hash)
      # @app.itunes_id = res["trackId"]
      # @app.name = res["trackName"]
      # @app.itunes_url = res["trackViewUrl"]
      # @app.icon_url = res["artworkUrl512"]
      # @app.developer = res["artistName"]
      # @app.developer_url = res["sellerUrl"]
      # @app.price = res["price"]
      # @app.description = res["description"]
      # @app.current_rating = res["averageUserRatingForCurrentVersion"]
      # @app.current_rating_count = res["userRatingCountForCurrentVersion"]
      # @app.total_rating = res["averageUserRating"]
      # @app.total_rating_count = res["userRatingCount"]
      # @app.category = res["primaryGenreName"]
      # @app.game_center_enabled = res["isGameCenterEnabled"]
      @app.is_universal = res["features"].include?("iosUniversal") if res["features"]

      # Hmmmmm......
      if @app.save

        @screenshot_urls = res["screenshotUrls"] # enumerate each to screenshots table
        @ipad_screenshot_urls = res["ipadScreenshotUrls"] # enumerate each to screenshots table

        unless @screenshot_urls.nil?
          @screenshot_urls.each do |screenshot|
            @app.screenshots.create(screenshot_url: screenshot)
          end
        end

        unless @ipad_screenshot_urls.nil?
          @ipad_screenshot_urls.each do |screenshot|          
            @app.screenshots.create(ipad_dcreenshot_url: screenshot)
          end
        end
        redirect_to app_path(@app)
      else
        # "something went wrong -- sorry, yo."
        render :search
      end
    else
      @app = find_app lookup_id
      redirect_to app_path(@app)
    end
  end

  def show
    @app = get_app
    @screenshots = get_screenshots
  end

  private

  def itunes_lookup itunes_id
    "https://itunes.apple.com/lookup?id=#{itunes_id}"
  end

  def itunes_search query
    query = query.gsub(" ","+")
    "https://itunes.apple.com/search?term=#{query}&media=software&limit=10"
  end

  def find_app itunes_id
    App.find_by(itunes_id: itunes_id)
  end

  def get_app
    App.find params[:id]
  end

  def get_screenshots
    Screenshot.where app_id: @app.id
  end
end