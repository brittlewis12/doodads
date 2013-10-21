class App < ActiveRecord::Base
  has_many :screenshots

  validates :name, :itunes_id, :itunes_url, :icon_url, :developer, :developer_url, :price, :description, :current_rating, :current_rating_count, :total_rating, :total_rating_count, :category, :game_center_enabled, :is_universal, presence: true
  validates :itunes_id, uniqueness: true
end