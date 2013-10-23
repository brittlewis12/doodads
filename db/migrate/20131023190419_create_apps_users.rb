class CreateAppsUsers < ActiveRecord::Migration
  def change
    create_table :apps_users do |t|
      t.belongs_to :app, null: false
      t.belongs_to :user, null: false
    end
  end
end