class ChangeAppsVersionTypeToString < ActiveRecord::Migration
  def change
    change_column :apps, :version, :string, null: false
  end
end
