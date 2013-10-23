class FetchedApp
  def initialize(json_resp)
    @json_resp = json_resp["results"][0]
  end

  ATTR_MAP = {
    itunes_id: "trackId",
    name: "trackName",
    itunes_url: "trackViewUrl",
    icon_url: "artworkUrl512",
    developer: "artistName",
    developer_url: "sellerUrl",
    price: "price",
    description: "description",
    current_rating: "averageUserRatingForCurrentVersion",
    current_rating_count: "userRatingCountForCurrentVersion",
    total_rating: "averageUserRating",
    total_rating_count: "userRatingCount",
    category: "primaryGenreName",
    game_center_enabled: "isGameCenterEnabled",
  }

  ATTR_MAP.each do |key, val|
    define_method key do
      @json_resp[val]
    end
  end

  def is_universal
    @json_resp["features"] ? @json_resp["features"].include?("iosUniversal") : false
  end

  def to_hash
    fetched_hash = ATTR_MAP.keys.reduce({}) do |hsh, method_name|
      hsh[method_name] = self.send(method_name)
      next hsh
    end
    binding.pry
    fetched_hash[:is_universal] = is_universal
    fetched_hash
  end
end