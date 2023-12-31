class CreateAppStatusInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :app_status_interactions do |t|
      t.string :name
      t.boolean :active
      t.string :icon
      t.string :style
      t.string :color
      t.references :client, null: false, foreign_key: {to_table: :app_clients}
      
      t.timestamps
    end
  end
end
