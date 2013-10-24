class CreateDoodads < ActiveRecord::Migration
  def change
    create_table :doodads do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :apps, null: false
      t.belongs_to :users, null: false

      t.timestamps
    end
  end
end
