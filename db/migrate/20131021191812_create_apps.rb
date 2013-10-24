class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.string :itunes_id, null: false
      t.string :itunes_url, null: false
      t.string :icon_url, null: false
      t.string :developer, null: false
      t.string :developer_url, null: false
      t.decimal :price, scale: 2, precision: 6, null: false
      t.text :version, null: false
      t.text :description, null: false
      t.decimal :current_rating, scale: 1, precision: 2, null: false
      t.integer :current_rating_count, null: false
      t.decimal :total_rating, scale: 1, precision: 2, null: false
      t.integer :total_rating_count, limit: 8, null: false
      t.string :category, null: false
      t.boolean :game_center_enabled
      t.boolean :is_universal

      t.timestamps
    end
  end
end