class RemoveNotNullConstraintFromDeveloperUrlInApps < ActiveRecord::Migration
  def change
    change_column :apps, :developer_url, :string, null: true 
  end
end
