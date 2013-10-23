class App < ActiveRecord::Base
  validates :name, :itunes_id, :itunes_url, :icon_url, :developer, :developer_url, :price, :description, :current_rating, :current_rating_count, :total_rating, :total_rating_count, :category, presence: true
  validates :game_center_enabled, :is_universal, inclusion: { in: [true, false] }
  validates :itunes_id, uniqueness: true

  has_many :screenshots

  has_and_belongs_to_many :users
end