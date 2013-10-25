class CreateDoodadsTable < ActiveRecord::Migration
  def change
    create_table :doodads do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :app, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end