class CreateAppUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :app_updates do |t|
      t.string :version
      t.date :release_date
      t.text :description
      t.text :added_features
      t.text :removed_features
      t.text :bugs_fixed

      t.timestamps
    end
  end
end
