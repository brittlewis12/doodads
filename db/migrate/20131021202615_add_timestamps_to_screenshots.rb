class AddTimestampsToScreenshots < ActiveRecord::Migration
  def change
    add_column :screenshots, :created_at, :datetime
    add_column :screenshots, :updated_at, :datetime
  end
end
