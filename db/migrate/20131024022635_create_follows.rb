class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.belongs_to :app, null: false
      t.belongs_to :user, null: false
      t.boolean :notify, default: true
      
      t.timestamps
    end
  end
end