class Screenshot < ActiveRecord::Base
  belongs_to :app

  validates :app_id, presence: true
end