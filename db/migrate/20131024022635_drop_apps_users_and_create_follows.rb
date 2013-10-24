class DropAppsUsersAndCreateFollows < ActiveRecord::Migration
  def change
    drop_table :apps_users

    create_table :follows do |t|
      t.belongs_to :apps, null: false
      t.belongs_to :users, null: false
      t.boolean :notify, default: true
      t.timestamps
    end
  end
end