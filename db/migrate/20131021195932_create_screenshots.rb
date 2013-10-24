class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :screenshot_url
      t.string :ipad_screenshot_url
      t.references :app, null: false, index: true

      t.timestamps
    end

  reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE screenshots
          ADD CONSTRAINT fk_screenshots_apps
          FOREIGN KEY (app_id)
          REFERENCES apps(id)
        SQL
      end
    end
  end
end